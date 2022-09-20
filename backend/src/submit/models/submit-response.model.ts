export class SubmitResponseModel {
    readonly code: number;
    readonly timestamp: number;

    constructor(code: number, timestamp: number) {
        this.code = code;
        this.timestamp = timestamp;
    }
}
