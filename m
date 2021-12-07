Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD7946BCC9
	for <lists+linux-cachefs@lfdr.de>; Tue,  7 Dec 2021 14:42:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638884564;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kOKo/YxLFcT6N4Zm8XVfAFeLmJ3AGl1Ab1K9QY0oHG4=;
	b=bYwW/E4SQq6rk/y1KH93sxF/9mP1QsNdcsGwxX9HjlTyPysnXVOxYE8hwDOrMUo28bqsRQ
	WDaAXskDMMDtKDeOzr2Zxf0OtbGfVVWG+loIVA+2Ljo85p5G5/3/P6V6lBFc3n9KM5eS0H
	um2mHiRXA4v/8JGVkkGDEiFntfFl//g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-FOo-FCTsOTqQGF4kWWEG5Q-1; Tue, 07 Dec 2021 08:42:41 -0500
X-MC-Unique: FOo-FCTsOTqQGF4kWWEG5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29D12101F001;
	Tue,  7 Dec 2021 13:42:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D69C694BF;
	Tue,  7 Dec 2021 13:42:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D06191809C87;
	Tue,  7 Dec 2021 13:42:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B7DgJWb011964 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 7 Dec 2021 08:42:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B77F940CFD10; Tue,  7 Dec 2021 13:42:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2BFC40CFD01
	for <linux-cachefs@redhat.com>; Tue,  7 Dec 2021 13:42:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9387F8011A5
	for <linux-cachefs@redhat.com>; Tue,  7 Dec 2021 13:42:19 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-337-bYCrdBIBN26-pUIte4eTTw-1; Tue, 07 Dec 2021 08:42:18 -0500
X-MC-Unique: bYCrdBIBN26-pUIte4eTTw-1
Received: by mail-qk1-f199.google.com with SMTP id
	bs14-20020a05620a470e00b0046b1e29f53cso16114615qkb.0
	for <linux-cachefs@redhat.com>; Tue, 07 Dec 2021 05:42:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=QFkOJkYB1Uxe2T0a8h6jEusxi+X2OG7bH/Bp7qucg9w=;
	b=ML3rTvkTBCqWEuzoax4N+kJyY8Gs60rPixtduAy7rm5U2hyJQKbadko0IhTAfwQJUS
	1mnIbGUzzKP47WpCuR4o3Gqwpxne90YCwRR0zHkGQ0tm11QkENbG/njVzhOIb9ToEhI2
	7tvsqwTlLwnWPdnPe9/eQn0/ptdi3ycraYKmECvDJETZkFaQnfle+L8Poq+bsFIZ0dBL
	mgXPSAKhA5n6aHCmAmASwEySZ+ioYBLb2ZeLYW5OnAUZGF72yAmw2O9kT0wyAgzkSpxM
	/SXXxKJf5O0HR2kalG6VnvZPxfK1TT8ZNzLS4pFuc5Fwj7szwEP934wWhZdZ9LnFWLpq
	qgcw==
X-Gm-Message-State: AOAM530tgiWQlWXDNfUzu+AlDN9GLx+DWDxZX5EM4XqGzhXTQ79DrsF8
	9OkFt8ASR8q+jDAajdDv/pHct0W9ikvu2m7Rc1/P3okiaa7I85/K2yHjbDaGY4qeUuT/Y9tZLOA
	ATaNXGB4sr42ADhf/sVtF6g==
X-Received: by 2002:a05:620a:4689:: with SMTP id
	bq9mr40849757qkb.242.1638884537795; 
	Tue, 07 Dec 2021 05:42:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyg8p/0Hq9h4Lug7LbFKUqGROwqTbJaprG7N7+V6Z7GYNVsAydFBlBJ2531rBELEjHrIdbfwQ==
X-Received: by 2002:a05:620a:4689:: with SMTP id
	bq9mr40849722qkb.242.1638884537554; 
	Tue, 07 Dec 2021 05:42:17 -0800 (PST)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
	[68.20.15.154]) by smtp.gmail.com with ESMTPSA id
	s12sm9442778qtk.61.2021.12.07.05.42.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Dec 2021 05:42:17 -0800 (PST)
Message-ID: <d621c5522bdee8113946e7d1e5e9822820e0ef5a.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>, dhowells@redhat.com
Date: Tue, 07 Dec 2021 08:42:16 -0500
In-Reply-To: <20211207031449.100510-1-jefflexu@linux.alibaba.com>
References: <20211207031449.100510-1-jefflexu@linux.alibaba.com>
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH] netfs: fix parameter of cleanup()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2021-12-07 at 11:14 +0800, Jeffle Xu wrote:
> The order of these two parameters is just reversed. gcc didn't warn on
> that, probably because 'void *' can be converted from or to other
> pointer types without warning.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3d3c95046742 ("netfs: Provide readahead and readpage netfs helpers")
> Fixes: e1b1240c1ff5 ("netfs: Add write_begin helper")
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/netfs/read_helper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
> index 7046f9bdd8dc..4adcb0336ecf 100644
> --- a/fs/netfs/read_helper.c
> +++ b/fs/netfs/read_helper.c
> @@ -960,7 +960,7 @@ int netfs_readpage(struct file *file,
>  	rreq = netfs_alloc_read_request(ops, netfs_priv, file);
>  	if (!rreq) {
>  		if (netfs_priv)
> -			ops->cleanup(netfs_priv, folio_file_mapping(folio));
> +			ops->cleanup(folio_file_mapping(folio), netfs_priv);
>  		folio_unlock(folio);
>  		return -ENOMEM;
>  	}
> @@ -1191,7 +1191,7 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
>  		goto error;
>  have_folio_no_wait:
>  	if (netfs_priv)
> -		ops->cleanup(netfs_priv, mapping);
> +		ops->cleanup(mapping, netfs_priv);
>  	*_folio = folio;
>  	_leave(" = 0");
>  	return 0;
> @@ -1202,7 +1202,7 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
>  	folio_unlock(folio);
>  	folio_put(folio);
>  	if (netfs_priv)
> -		ops->cleanup(netfs_priv, mapping);
> +		ops->cleanup(mapping, netfs_priv);
>  	_leave(" = %d", ret);
>  	return ret;
>  }

Ouch, good catch.

Reviewed-by: Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

