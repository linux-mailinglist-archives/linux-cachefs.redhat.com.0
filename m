Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F2B8B35552B
	for <lists+linux-cachefs@lfdr.de>; Tue,  6 Apr 2021 15:31:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-fSguIDWXMx6EUpc_YYpUrg-1; Tue, 06 Apr 2021 09:31:38 -0400
X-MC-Unique: fSguIDWXMx6EUpc_YYpUrg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E1BC800D53;
	Tue,  6 Apr 2021 13:31:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CEEF60937;
	Tue,  6 Apr 2021 13:31:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6ED331809C83;
	Tue,  6 Apr 2021 13:31:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 136DVXLx009798 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 09:31:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 376D42026D6B; Tue,  6 Apr 2021 13:31:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31C7A2026D48
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 13:31:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 869EE85A5BE
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 13:31:29 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-437-ruUM3VjmOLOiogFyDcHv4w-1; Tue, 06 Apr 2021 09:31:27 -0400
X-MC-Unique: ruUM3VjmOLOiogFyDcHv4w-1
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lTln6-00CrXl-3O; Tue, 06 Apr 2021 13:30:53 +0000
Date: Tue, 6 Apr 2021 14:30:48 +0100
From: Christoph Hellwig <hch@infradead.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <20210406133048.GD3062550@infradead.org>
References: <20210331184728.1188084-1-willy@infradead.org>
	<20210331184728.1188084-6-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210331184728.1188084-6-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v6 05/27] mm: Add folio reference count
	functions
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 31, 2021 at 07:47:06PM +0100, Matthew Wilcox (Oracle) wrote:
> These functions mirror their page reference counterparts.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  Documentation/core-api/mm-api.rst |  1 +
>  include/linux/page_ref.h          | 88 ++++++++++++++++++++++++++++++-
>  2 files changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
> index 34f46df91a8b..1ead2570b217 100644
> --- a/Documentation/core-api/mm-api.rst
> +++ b/Documentation/core-api/mm-api.rst
> @@ -97,3 +97,4 @@ More Memory Management Functions
>     :internal:
>  .. kernel-doc:: include/linux/mm.h
>     :internal:
> +.. kernel-doc:: include/linux/page_ref.h
> diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
> index f3318f34fc54..f27005e760fd 100644
> --- a/include/linux/page_ref.h
> +++ b/include/linux/page_ref.h
> @@ -69,7 +69,29 @@ static inline int page_ref_count(struct page *page)
>  
>  static inline int page_count(struct page *page)
>  {
> -	return atomic_read(&compound_head(page)->_refcount);
> +	return page_ref_count(compound_head(page));
> +}

I don't think this change belongs in here.  It seems useful though,
so maybe split it into a standalone patch?

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

