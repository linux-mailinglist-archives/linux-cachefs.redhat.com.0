Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0AD357EA5
	for <lists+linux-cachefs@lfdr.de>; Thu,  8 Apr 2021 11:02:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-99sYuL6QP462SdVorccqKw-1; Thu, 08 Apr 2021 05:02:20 -0400
X-MC-Unique: 99sYuL6QP462SdVorccqKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BA7D79EC5;
	Thu,  8 Apr 2021 09:02:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 214595D9E3;
	Thu,  8 Apr 2021 09:02:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 129FD1806D0F;
	Thu,  8 Apr 2021 09:02:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 138925Qf014637 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 8 Apr 2021 05:02:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F8CEF6CB5; Thu,  8 Apr 2021 09:02:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89E27F6CC2
	for <linux-cachefs@redhat.com>; Thu,  8 Apr 2021 09:02:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 345FA185A7B9
	for <linux-cachefs@redhat.com>; Thu,  8 Apr 2021 09:02:03 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
	[209.85.218.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-449-89--RNitP4ibMrbvXG15xw-1; Thu, 08 Apr 2021 05:02:00 -0400
X-MC-Unique: 89--RNitP4ibMrbvXG15xw-1
Received: by mail-ej1-f48.google.com with SMTP id v6so489298ejo.6
	for <linux-cachefs@redhat.com>; Thu, 08 Apr 2021 02:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cXalpWPdovuqi5PtyyBVt6MR8In8wK+QHdjt9pvsaQ4=;
	b=etmMKcctyQAFcU9GaUqAMM914yjNli4EnlQEHQ/qnVstmwH3A6XeY8aOPXvhz8YEup
	Bct3BhrbimZdfXZ5pFLxblLGl/1u57W/J+J2P3XYFqLQLbox/ZG2y1wAsTJAzA5fg0n5
	m5ydPESlOk4eoQxvGRMF073fb/0o4Yedcd7p3TdYxsz7EE5g2k5k4JP7D0rR/iCnC2Fg
	3v6bC+Pub/xjw4MPTugLWC93pBdw72LUrrFvphR5ct4/TImrI9Jlr2GolXo8+ARx9a3W
	DC2Z7WpQaVNFIL3M0RlcRT2ZaKCOrJsM/pvUiCKg23QFKcuAMWqHTlJ05rx5fOSmkfYR
	1eKQ==
X-Gm-Message-State: AOAM533/3DwCiQQAAWzdMc8qzRAU+uaf6w2zKNm16hnyg27dub4qSDqr
	OYBVbOapFiMlFDR51qXpsj9O/dHIXczjIg==
X-Google-Smtp-Source: ABdhPJzBa4HtKr4hNJ415kDMr8yGygx8z+sS2pW2rkqme7X4wimsY5DsOfWZUwuhrlrMqbDHdk49Vw==
X-Received: by 2002:a17:906:3713:: with SMTP id
	d19mr8909450ejc.513.1617872518956; 
	Thu, 08 Apr 2021 02:01:58 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
	by smtp.gmail.com with ESMTPSA id
	s6sm10262058ejv.11.2021.04.08.02.01.58
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 08 Apr 2021 02:01:58 -0700 (PDT)
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-mm@kvack.org
References: <20210331184728.1188084-1-willy@infradead.org>
	<20210331184728.1188084-2-willy@infradead.org>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <f89f694f-d472-3287-51aa-86258e107361@rasmusvillemoes.dk>
Date: Thu, 8 Apr 2021 11:01:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210331184728.1188084-2-willy@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v6 01/27] mm: Introduce struct folio
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 31/03/2021 20.47, Matthew Wilcox (Oracle) wrote:

> +static inline void folio_build_bug(void)
> +{
> +#define FOLIO_MATCH(pg, fl)						\
> +BUILD_BUG_ON(offsetof(struct page, pg) != offsetof(struct folio, fl));
> +
> +	FOLIO_MATCH(flags, flags);
> +	FOLIO_MATCH(lru, lru);
> +	FOLIO_MATCH(mapping, mapping);
> +	FOLIO_MATCH(index, index);
> +	FOLIO_MATCH(private, private);
> +	FOLIO_MATCH(_mapcount, _mapcount);
> +	FOLIO_MATCH(_refcount, _refcount);
> +#ifdef CONFIG_MEMCG
> +	FOLIO_MATCH(memcg_data, memcg_data);
> +#endif
> +#undef FOLIO_MATCH
> +	BUILD_BUG_ON(sizeof(struct page) != sizeof(struct folio));
> +}
> +

Perhaps do this next to the definition of struct folio instead of hiding
it in some arbitrary TU - hint, we have static_assert() that doesn't
need to be in function context. And consider amending FOLIO_MATCH by a
static_assert(__same_type(typeof_member(...), typeof_member(...))).

Rasmus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

