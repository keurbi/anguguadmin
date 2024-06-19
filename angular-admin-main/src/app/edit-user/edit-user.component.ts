import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component, inject } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-edit-user',
  standalone: true,
  imports: [
    FormsModule,
    ReactiveFormsModule,
    MatInputModule,
    MatSelectModule,
    MatButtonModule,
    HttpClientModule,
    MatSnackBarModule,
  ],
  templateUrl: './edit-user.component.html',
  styleUrl: './edit-user.component.scss',
})
export class EditUserComponent {
  http: HttpClient = inject(HttpClient);
  formBuilder: FormBuilder = inject(FormBuilder);
  snackBar: MatSnackBar = inject(MatSnackBar);
  router: Router = inject(Router);
  route: ActivatedRoute = inject(ActivatedRoute);

  formulaire: FormGroup = this.formBuilder.group({
    email: ['', [Validators.required, Validators.email]],
    password: ['', [Validators.required]],
    firstname: ['', [Validators.required]],
    lastname: ['', [Validators.required]],
    role: ['Etudiant', [Validators.required]],
  });

  roleList: string[] = ['Eleve', 'Admin'];

  userId?: number;

  ngOnInit() {
    this.route.params.subscribe((parametres) => {
      //si il y a bien un parametre dans l'URL et que c'est bien un nombre
      if (parametres['id'] && !isNaN(parametres['id'])) {
        this.userId = parametres['id'];

        this.formulaire = this.formBuilder.group({
          email: ['', [Validators.required, Validators.email]],
          password: ['', []],
          firstname: ['', [Validators.required]],
          lastname: ['', [Validators.required]],
          role: ['Etudiant', [Validators.required]],
        });

        const jwt = localStorage.getItem('jwt');

        if (jwt) {
          this.http
            .get(
              'http://localhost/backend-angular-admin/get-user.php?id=' +
                parametres['id'],
              { headers: { Authorization: jwt } }
            )
            .subscribe({
              next: (utilisateur) => this.formulaire.patchValue(utilisateur),
              error: (erreur) => alert(erreur.error.message),
            });
        }
      } else {
        this.formulaire = this.formBuilder.group({
          email: ['', [Validators.required, Validators.email]],
          password: ['', [Validators.required]],
          firstname: ['', [Validators.required]],
          lastname: ['', [Validators.required]],
          role: ['Etudiant', [Validators.required]],
        });
      }
    });
  }

  onAjoutUtilisateur() {
    if (this.formulaire.valid) {
      const url = this.userId
        ? 'http://localhost/backend-angular-admin/edit-user.php?id=' +
          this.userId
        : 'http://localhost/backend-angular-admin/add-user.php';


       const jwt = localStorage.getItem('jwt');

        if (jwt) {

          this.http
            .post(url, this.formulaire.value, {
              headers: { Authorization: jwt },
            })
            .subscribe({
              next: (resultat) => {
                this.snackBar.open(
                  "L'utilisateur a bien été " +
                    (this.userId ? 'modifié' : 'ajouté'),
                  undefined,
                  {
                    duration: 3000,
                  }
                );
                this.router.navigateByUrl('/gestion-utilisateurs');
              },
              error: (erreur) => {
                if (erreur.status == 409) {
                  alert(erreur.error.message);
                } else {
                  alert('Erreur inconnue, contactez votre administrateur');
                }
              },
            });
        }
    }
  }
}
