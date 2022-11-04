Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2FC618F5F
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Nov 2022 05:05:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667534724;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1kOo1yL5oCZ7e27IiBYVoB1pLxsJaAzLksW/uokbZ7w=;
	b=R4TU3x9sb+06kP3hOv2YcLHnT8yHUOF5shQjGTgU5hQiv8IqIaBJYUyDGYLlsk3BZMipHm
	tRskj50vVxKGFN5BVM4H6muYrsDUhyWrH6eV0VcOlgSDmHQqC3L5IEXyig+1lvTFHy38Vz
	VCsNxIC5iITUbpUSlN+JqjyPJ1JqEQs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-z1HorvTbPNiJoioMb19zSA-1; Fri, 04 Nov 2022 00:05:21 -0400
X-MC-Unique: z1HorvTbPNiJoioMb19zSA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0E45101A54E;
	Fri,  4 Nov 2022 04:05:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF232140EBF5;
	Fri,  4 Nov 2022 04:05:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A3D7719465B2;
	Fri,  4 Nov 2022 04:05:19 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9B6321946594 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  4 Nov 2022 04:05:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 522561402BFF; Fri,  4 Nov 2022 04:05:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A98F140EBF5
 for <linux-cachefs@redhat.com>; Fri,  4 Nov 2022 04:05:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3482B862FEC
 for <linux-cachefs@redhat.com>; Fri,  4 Nov 2022 04:05:18 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-180-eBzXPkOyO-CAczi9xzI87A-1; Fri,
 04 Nov 2022 00:05:16 -0400
X-MC-Unique: eBzXPkOyO-CAczi9xzI87A-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oqnZb-0072RF-Cu; Fri, 04 Nov 2022 03:40:51 +0000
Date: Fri, 4 Nov 2022 03:40:51 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <Y2SJw7w1IsIik3nb@casper.infradead.org>
References: <166751120808.117671.15797010154703575921.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <166751120808.117671.15797010154703575921.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH] netfs: Fix missing xas_retry() calls in
 xarray iteration
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
Cc: linux-fsdevel@vger.kernel.org, George Law <glaw@redhat.com>,
 linux-cachefs@redhat.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 03, 2022 at 09:33:28PM +0000, David Howells wrote:
> +++ b/fs/netfs/buffered_read.c
> @@ -46,10 +46,15 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
>  
>  	rcu_read_lock();
>  	xas_for_each(&xas, folio, last_page) {
> -		unsigned int pgpos = (folio_index(folio) - start_page) * PAGE_SIZE;
> -		unsigned int pgend = pgpos + folio_size(folio);
> +		unsigned int pgpos, pgend;

"unsigned int" assumes that the number of bytes isn't going to exceed 32
bits.  I tend to err on the side of safety here and use size_t.

>  		bool pg_failed = false;
>  
> +		if (xas_retry(&xas, folio))
> +			continue;
> +
> +		pgpos = (folio_index(folio) - start_page) * PAGE_SIZE;
> +		pgend = pgpos + folio_size(folio);

What happens if start_page is somewhere inside folio?  Seems to me
that pgend ends up overhanging into the next folio?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

