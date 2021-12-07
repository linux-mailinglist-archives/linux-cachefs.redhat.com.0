Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0650C46AFCD
	for <lists+linux-cachefs@lfdr.de>; Tue,  7 Dec 2021 02:32:42 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-565-9qish04tNPy8UhXblfdkYw-1; Mon, 06 Dec 2021 20:32:38 -0500
X-MC-Unique: 9qish04tNPy8UhXblfdkYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02FD08042E1;
	Tue,  7 Dec 2021 01:32:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CD2A6929D;
	Tue,  7 Dec 2021 01:32:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33D774BB7C;
	Tue,  7 Dec 2021 01:32:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B71WS1W019768 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 6 Dec 2021 20:32:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B65D4492C3B; Tue,  7 Dec 2021 01:32:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B21B2492C38
	for <linux-cachefs@redhat.com>; Tue,  7 Dec 2021 01:32:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98B2885A5AA
	for <linux-cachefs@redhat.com>; Tue,  7 Dec 2021 01:32:28 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-252-S-62IEIrM2WhDFFJoJtrRQ-1; Mon, 06 Dec 2021 20:32:27 -0500
X-MC-Unique: S-62IEIrM2WhDFFJoJtrRQ-1
Received: from mail.kernel.org (unknown [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DA45CB81607;
	Tue,  7 Dec 2021 01:23:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6DC460E09;
	Tue,  7 Dec 2021 01:23:41 +0000 (UTC)
Date: Mon, 6 Dec 2021 17:23:40 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Huangzhaoyang <huangzhaoyang@gmail.com>
Message-Id: <20211206172340.fded3873aed7e853b54ab276@linux-foundation.org>
In-Reply-To: <1638760762-27239-1-git-send-email-huangzhaoyang@gmail.com>
References: <1638760762-27239-1-git-send-email-huangzhaoyang@gmail.com>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-cachefs@redhat.com
Cc: linux-mm@kvack.org, linux-cachefs@redhat.com, linux-kernel@vger.kernel.org,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>
Subject: Re: [Linux-cachefs] [PATCH] mm: mask DIRECT_RECLAIM in kswapd
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon,  6 Dec 2021 11:19:22 +0800 Huangzhaoyang <huangzhaoyang@gmail.com> wrote:

> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> 
> As the eg bellowing, using GFP_KERNEL could confuse the registered .releasepage
> or .shrinker functions when called in kswapd and have them acting wrongly.Mask
> __GFP_DIRECT_RECLAIM in kswapd.
> 
> eg,
> kswapd
>   shrink_page_list
>     try_to_release_page
>       __fscache_maybe_release_page
> 	...
>          if (!(gfp & __GFP_DIRECT_RECLAIM) || !(gfp & __GFP_FS)) {
>                  fscache_stat(&fscache_n_store_vmscan_busy);
>                  return false;
>          }

Well, we have thus far been permitting kswapd's memory allocations to
enter direct reclaim.  Forbidding that kernel-wide might be the right
thing to do, or might not be.  But disabling it kernel-wide because of
a peculiar hack in fscache is not good justification.

> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4083,7 +4083,7 @@ static int balance_pgdat(pg_data_t *pgdat, int order, int highest_zoneidx)
>  	bool boosted;
>  	struct zone *zone;
>  	struct scan_control sc = {
> -		.gfp_mask = GFP_KERNEL,
> +		.gfp_mask = GFP_KERNEL & ~__GFP_DIRECT_RECLAIM,
>  		.order = order,
>  		.may_unmap = 1,
>  	};

Maybe hack the hack like this?

--- a/fs/fscache/page.c~a
+++ a/fs/fscache/page.c
@@ -126,8 +126,10 @@ page_busy:
 	 * sleeping on memory allocation, so we may need to impose a timeout
 	 * too. */
 	if (!(gfp & __GFP_DIRECT_RECLAIM) || !(gfp & __GFP_FS)) {
-		fscache_stat(&fscache_n_store_vmscan_busy);
-		return false;
+		if (!current_is_kswapd()) {
+			fscache_stat(&fscache_n_store_vmscan_busy);
+			return false;
+		}
 	}
 
 	fscache_stat(&fscache_n_store_vmscan_wait);
_

But please, do cc the fscache mailing list and maintainer when mucking
with these things.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

