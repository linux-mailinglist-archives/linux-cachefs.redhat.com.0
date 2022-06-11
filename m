Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8436154777F
	for <lists+linux-cachefs@lfdr.de>; Sat, 11 Jun 2022 22:27:34 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-FSEwbZXCPy6QQR1AGP8UJw-1; Sat, 11 Jun 2022 16:27:29 -0400
X-MC-Unique: FSEwbZXCPy6QQR1AGP8UJw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47617101A54E;
	Sat, 11 Jun 2022 20:27:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7212A1121319;
	Sat, 11 Jun 2022 20:27:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C93CC194705D;
	Sat, 11 Jun 2022 20:27:26 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C3A2E1947061 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 11 Jun 2022 13:44:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8A744C2811A; Sat, 11 Jun 2022 13:44:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86831C28118
 for <linux-cachefs@redhat.com>; Sat, 11 Jun 2022 13:44:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F9B785A581
 for <linux-cachefs@redhat.com>; Sat, 11 Jun 2022 13:44:05 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-uaWyd9vzO_ubxdHsLt8-KA-1; Sat, 11 Jun 2022 09:44:01 -0400
X-MC-Unique: uaWyd9vzO_ubxdHsLt8-KA-1
Received: by mail-pl1-f175.google.com with SMTP id q18so1451862pln.12;
 Sat, 11 Jun 2022 06:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=Ixh/tGjYEGtd9B0U4un+L2Dg2/GvxVifxx8JOO5/xxs=;
 b=77aOQKGKFXmqHY+OBcuyj0qMjLPTlEkHPe12EU2jFdmgiBvtCyXBf9HwfXYOgOb6yI
 a3wBBT4NFncyEz/XNUWCyZ+BTMoUJzrVBYExxUIOkexg9rsLUGjJlOm76xJGwdxcOJXL
 xTAG+LkgI3pdL8/bcaItSu6ndxXpCL0JKrVICGTKe7iW7MOrcguF8/VW43y0G7bN9wzY
 LU2o+ibZBFLioPrsDj4tdOE+gMhmhIwycgP3Dy3rwAuZgtv3Ig+7+VfcePnd8k8r6+q+
 oLs6HWkoQa0BCNRN6NdPmrlWF8IC22vrpWBkCi3iWVBLE+v90W+hMmJfnovTiuQvmZAR
 jyzg==
X-Gm-Message-State: AOAM531IU7k7SFTTn3ajzmMGjb58VRNnMQmtagYCFiUtVC2ewymWljkC
 4plmZ8J+83GgQJ1BGgruy4Gu/Fex78Q=
X-Google-Smtp-Source: ABdhPJyVm1Qx3rpbnexbaPz3LjRNh5xdY5jWDRPJD5O1BPtSHpLAWd+II5ejGzWE9luF6mWKd4zRSA==
X-Received: by 2002:a17:902:9f96:b0:163:dc33:6b72 with SMTP id
 g22-20020a1709029f9600b00163dc336b72mr50033692plq.34.1654955039652; 
 Sat, 11 Jun 2022 06:43:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a1709027e4c00b00164097a779fsm1523377pln.147.2022.06.11.06.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 06:43:58 -0700 (PDT)
Date: Sat, 11 Jun 2022 06:43:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: David Howells <dhowells@redhat.com>
Message-ID: <20220611134357.GA278954@roeck-us.net>
References: <165476202136.3999992.433442175457370240.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <165476202136.3999992.433442175457370240.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mailman-Approved-At: Sat, 11 Jun 2022 20:27:25 +0000
Subject: Re: [Linux-cachefs] [PATCH] iov_iter: Fix iter_xarray_get_pages{,
 _alloc}()
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Dominique Martinet <asmadeus@codewreck.org>, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, Gao Xiang <xiang@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-afs@lists.infradead.org,
 devel@lists.orangefs.org, Mike Marshall <hubcap@omnibond.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 09, 2022 at 09:07:01AM +0100, David Howells wrote:
> The maths at the end of iter_xarray_get_pages() to calculate the actual
> size doesn't work under some circumstances, such as when it's been asked to
> extract a partial single page.  Various terms of the equation cancel out
> and you end up with actual == offset.  The same issue exists in
> iter_xarray_get_pages_alloc().
> 
> Fix these to just use min() to select the lesser amount from between the
> amount of page content transcribed into the buffer, minus the offset, and
> the size limit specified.
> 
> This doesn't appear to have caused a problem yet upstream because network
> filesystems aren't getting the pages from an xarray iterator, but rather
> passing it directly to the socket, which just iterates over it.  Cachefiles
> *does* do DIO from one to/from ext4/xfs/btrfs/etc. but it always asks for
> whole pages to be written or read.
> 
> Fixes: 7ff5062079ef ("iov_iter: Add ITER_XARRAY")
> Reported-by: Jeff Layton <jlayton@kernel.org>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Alexander Viro <viro@zeniv.linux.org.uk>
> cc: Dominique Martinet <asmadeus@codewreck.org>
> cc: Mike Marshall <hubcap@omnibond.com>
> cc: Gao Xiang <xiang@kernel.org>
> cc: linux-afs@lists.infradead.org
> cc: v9fs-developer@lists.sourceforge.net
> cc: devel@lists.orangefs.org
> cc: linux-erofs@lists.ozlabs.org
> cc: linux-cachefs@redhat.com
> cc: linux-fsdevel@vger.kernel.org
> ---
> 
>  lib/iov_iter.c |   20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> index 834e1e268eb6..814f65fd0c42 100644
> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@ -1434,7 +1434,7 @@ static ssize_t iter_xarray_get_pages(struct iov_iter *i,
>  {
>  	unsigned nr, offset;
>  	pgoff_t index, count;
> -	size_t size = maxsize, actual;
> +	size_t size = maxsize;
>  	loff_t pos;
>  
>  	if (!size || !maxpages)
> @@ -1461,13 +1461,7 @@ static ssize_t iter_xarray_get_pages(struct iov_iter *i,
>  	if (nr == 0)
>  		return 0;
>  
> -	actual = PAGE_SIZE * nr;
> -	actual -= offset;
> -	if (nr == count && size > 0) {
> -		unsigned last_offset = (nr > 1) ? 0 : offset;
> -		actual -= PAGE_SIZE - (last_offset + size);
> -	}
> -	return actual;
> +	return min(nr * PAGE_SIZE - offset, maxsize);

This needs min_t to avoid a build error on 32-bit builds.

In file included from include/linux/kernel.h:26,
                 from include/linux/crypto.h:16,
                 from include/crypto/hash.h:11,
                 from lib/iov_iter.c:2:
lib/iov_iter.c: In function 'iter_xarray_get_pages':
include/linux/minmax.h:20:35: error: comparison of distinct pointer types lacks a cast [-Werror]
...
lib/iov_iter.c:1628:16: note: in expansion of macro 'min'
 1628 |         return min(nr * PAGE_SIZE - offset, maxsize);
      |                ^~~

Guenter

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

