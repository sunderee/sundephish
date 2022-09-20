import { OverviewModel } from './overview.model';

export class CollectModel {
    groupID: string;
    total: number;
    overview: OverviewModel;

    constructor(groupID: string, total: number, overview: OverviewModel) {
        this.groupID = groupID;
        this.total = total;
        this.overview = overview;
    }
}
