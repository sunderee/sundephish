export class OverviewModel {
    openBrowser: number;
    clickSignUp: number;
    clickForgotPassword: number;
    submittedCredentials: number;

    constructor(
        openBrowser: number,
        clickSignUp: number,
        clickForgotPassword: number,
        submittedCredentials: number
    ) {
        this.openBrowser = openBrowser;
        this.clickSignUp = clickSignUp;
        this.clickForgotPassword = clickForgotPassword;
        this.submittedCredentials = submittedCredentials;
    }
}
