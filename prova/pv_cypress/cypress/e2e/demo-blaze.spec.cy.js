describe('DemoBlaze Tests', () => {
  beforeEach(() => {
    cy.visit('https://www.demoblaze.com/index.html');
  });

  it('Verificar a categoria de produtos', () => {
    cy.get('.list-group-item').should('have.length.greaterThan', 0);
  });

  it('Adicionar produto ao carrinho', () => {
    cy.get(':nth-child(1) > .card > .card-block > .card-title > .hrefch').click();
    cy.contains('Add to cart').click();
    cy.get('#cartur').click(); 
    cy.get('#totalp').should('have.text', '360');
  });

  it('Login com credenciais inválidas', () => {
    login()
    cy.on('window:alert', (text) => {
      expect(text).to.include('User does not exist.');
    });
  });
});

function login() {
  cy.get('#login2').click();
  cy.get('#loginusername').type('invaliduser');
  cy.get('#loginpassword').type('invalidpassword');
  cy.get('#logInModal > .modal-dialog > .modal-content > .modal-footer > .btn-primary').click();
}
