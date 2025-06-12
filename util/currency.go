package util

const (
	USD = "USD"
	EUR = "EUR"
	IND = "IND"
)

func IsSupportedCurrency(currency string) bool {
	switch currency {
		case USD, EUR, INR:
			return true 
	}
	return false
}