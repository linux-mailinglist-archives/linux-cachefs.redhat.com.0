Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EAFA4359D55
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 13:29:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-teJZYoqWMnGgHpL53e8tWA-1; Fri, 09 Apr 2021 07:29:35 -0400
X-MC-Unique: teJZYoqWMnGgHpL53e8tWA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 151F56D246;
	Fri,  9 Apr 2021 11:29:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 592BE62954;
	Fri,  9 Apr 2021 11:29:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D204855345;
	Fri,  9 Apr 2021 11:29:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139BQhoY031192 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 07:26:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4FD58104833; Fri,  9 Apr 2021 11:26:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A2DE10482F
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 11:26:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E599D802C1E
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 11:26:40 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-490-kt_jbLG7P4iVO7qCPy8UPw-1; Fri, 09 Apr 2021 07:26:39 -0400
X-MC-Unique: kt_jbLG7P4iVO7qCPy8UPw-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lUpFw-000HJN-Uc; Fri, 09 Apr 2021 11:25:05 +0000
Date: Fri, 9 Apr 2021 12:24:56 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210409112456.GS2531743@casper.infradead.org>
References: <CAHk-=wi_XrtTanTwoKs0jwnjhSvwpMYVDJ477VtjvvTXRjm5wQ@mail.gmail.com>
	<161796596902.350846.10297397888865722494.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <161796596902.350846.10297397888865722494.stgit@warthog.procyon.org.uk>
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, jlayton@kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	ceph-devel@vger.kernel.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net,
	Andrew Morton <akpm@linux-foundation.org>,
	torvalds@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [RFC PATCH 3/3] mm: Split page_has_private() in
 two to better handle PG_private_2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 09, 2021 at 11:59:29AM +0100, David Howells wrote:
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 414769a6ad11..9c89db033548 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -41,7 +41,7 @@ static inline struct iomap_page *to_iomap_page(struct page *page)
>  	 */
>  	VM_BUG_ON_PGFLAGS(PageTail(page), page);
>  
> -	if (page_has_private(page))
> +	if (page_needs_cleanup(page))

That should be PagePrivate(page)

>  		return (struct iomap_page *)page_private(page);
>  	return NULL;
>  }
> @@ -163,7 +163,7 @@ iomap_set_range_uptodate(struct page *page, unsigned off, unsigned len)
>  	if (PageError(page))
>  		return;
>  
> -	if (page_has_private(page))
> +	if (PagePrivate(page))
>  		iomap_iop_set_range_uptodate(page, off, len);
>  	else
>  		SetPageUptodate(page);
> @@ -502,7 +502,7 @@ iomap_migrate_page(struct address_space *mapping, struct page *newpage,
>  	if (ret != MIGRATEPAGE_SUCCESS)
>  		return ret;
>  
> -	if (page_has_private(page))
> +	if (PagePrivate(page))
>  		attach_page_private(newpage, detach_page_private(page));
>  
>  	if (mode != MIGRATE_SYNC_NO_COPY)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

