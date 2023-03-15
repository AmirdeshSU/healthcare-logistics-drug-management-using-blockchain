function auto_delivery(uint pid, uint threshold, uint quantity) public onlydm(msg.sender) {
    uint stock = drugs[pid].avail;
    if (stock < threshold) {
        // calculate amount to order
        uint order_amount = quantity - stock;
        
        // place order
        orders[orderdid].hospid = 0; // set to 0 to indicate it's an auto order
        orders[orderdid].time = block.timestamp;
        orders[orderdid].drugid = pid;
        orders[orderdid].quantity = order_amount;
        orders[orderdid].amount = order_amount * drugs[pid].rate;
        orderdid += 1;

        // update drug availability
        drugs[pid].avail += order_amount;
    }
}
