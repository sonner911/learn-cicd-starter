package auth

import (
	"net/http"
	"testing"
)

func TestGetAPIKey(t *testing.T) {
	expectedKey := "abc"
	headers := http.Header{}
	headers["Authorization"] = []string{"ApiKey " + expectedKey}

	actualKey, err := GetAPIKey(headers)
	if err != nil {
		t.Fatalf("unexpected error: %v", err)
		return
	}

	if actualKey != expectedKey {
		t.Fatalf("%s != %s", actualKey, expectedKey)
	}
}
