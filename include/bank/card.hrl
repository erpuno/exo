-ifndef(CARD_HRL).
-define(CARD_HRL, "card_hrl").

% could be used both for bank and client connector software

-record(card, {id,next,prev,
        balance,
        balanceTarget,
        bank,
        can,
        can_target,
        can_state,
        card_alias,
        card_name,
        card_state,
        contract_state,
        contract_type,
        credit_limit,
        currency,
        exdate,
        pan,
        product_type,
        ref_contract,
        ref_contract_target,
        san,
        is_target = false,
        cvc,
        brand,
        funding,
        address,
        city,
        state,
        zip,
        country,
        account,
        client
        }).

-endif.
