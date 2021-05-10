module Payrix
  module Resource
    class Merchants < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'merchants'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :lastActivity, :entity, :dba, :new, :established, 
               :annualCCSales, :avgTicket, :amex, :discover, :mcc, 
               :status, :boarded, :inactive, :frozen, :environment, 
               :visaMvv, :chargebackNotificationEmail, :statusReason, :totalApprovedSales, :autoBoarded, 
               :saqType, :saqDate, :qsa, :letterStatus, :letterDate, 
               :tcAttestation, :visaDisclosure, :disclosureIP, :disclosureDate, :accountClosureReasonCode, 
               :accountClosureReasonDate, :annualCCSaleVolume, :annualACHSaleVolume, :riskLevel, :creditRatio, 
               :creditTimeliness, :chargebackRatio, :ndxDays, :ndxPercentage, :advancedBilling, 
               :locationType, :percentKeyed, :totalVolume, :percentCardNotPresent, :seasonal, 
               :amexVolume, :incrementalAuthSupported, :tmxSessionId]

      attr_accessor *ATTRS

    end
  end
end
