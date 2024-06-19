import { Component, inject } from '@angular/core';
import { RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';
import { AuthentificationService } from './authentification.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, RouterLink, RouterLinkActive],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss',
})
export class AppComponent {
  authentification: AuthentificationService = inject(AuthentificationService);
  router: Router = inject(Router);

  ngOnInit() {
    this.authentification.getInfoFromJwtLocalStorage();
  }

  deconnexion() {
    this.authentification.deconnexion();
    this.router.navigate(['/connexion']); // Redirige vers la page de connexion
  }
}
