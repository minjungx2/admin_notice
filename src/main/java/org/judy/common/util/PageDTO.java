package org.judy.common.util;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Builder.Default;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PageDTO {

	@Default
	private Integer page = 1;

	@Default
	private Integer perSheet = 10;

	public Integer getSkip() {

		return (page - 1) * perSheet;
	}

}
