class InvoicesController < ApplicationController
  def index
    @invoices_as_customers = policy_scope(current_user.invoices)
  end

  def show
    @invoice = Invoice.find(params[:id])
    authorize @invoice
  end

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @invoice = Invoice.new(paid: false, reservation: @reservation)
    if @invoice.save
      authorize @invoice
      @reservation.update(negotiation_status: "confirmation")
      redirect_to invoice_path(@invoice)
    else
      render reservations_path
    end
  end
end
