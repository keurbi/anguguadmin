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
import { RouterLink } from '@angular/router';
import { MatIconModule } from '@angular/material/icon';
import { MatTableModule } from '@angular/material/table';

@Component({
  selector: 'app-add-retard',
  standalone: true,
  imports: [
    RouterLink,
    FormsModule,
    ReactiveFormsModule,
    MatInputModule,
    MatSelectModule,
    MatButtonModule,
    HttpClientModule,
    MatSnackBarModule,
    MatIconModule,
    MatTableModule,
  ],
  templateUrl: './add-retard.component.html',
  styleUrl: './add-retard.component.scss'
})

export class AddRetardComponent {
  html: HttpClient = inject(HttpClient);
  retardList: any = [];
   activatedRoute = inject(ActivatedRoute);

  ngOnInit() {
    this.raffraichir();
  }

  raffraichir() {
    const jwt = localStorage.getItem('jwt');

    if (jwt) {
      this.html
        .get('http://localhost/backend-angular-admin/retard-list.php?id=' + this.activatedRoute.snapshot.params['id'], {
          headers: { Authorization: jwt },
        })
        .subscribe({
          next: (result) => (this.retardList = result),
          error: () => alert('Erreur inconnue, contactez votre administrateur'),
        });
    }
  }
}

