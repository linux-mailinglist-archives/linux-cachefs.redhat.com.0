Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 806953AEB85
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Jun 2021 16:37:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-meUsIqXVO2yhJjbVezkMgA-1; Mon, 21 Jun 2021 10:37:35 -0400
X-MC-Unique: meUsIqXVO2yhJjbVezkMgA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0796101F000;
	Mon, 21 Jun 2021 14:37:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A05D85D703;
	Mon, 21 Jun 2021 14:37:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6AD864EA2A;
	Mon, 21 Jun 2021 14:37:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15LEbSfp025058 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 10:37:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DDB4D2160294; Mon, 21 Jun 2021 14:37:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D92B921686AC
	for <linux-cachefs@redhat.com>; Mon, 21 Jun 2021 14:37:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3C2610AF957
	for <linux-cachefs@redhat.com>; Mon, 21 Jun 2021 14:37:23 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-502-fVHHTXd4MmyK_wtGbFBC6w-1; Mon, 21 Jun 2021 10:37:21 -0400
X-MC-Unique: fVHHTXd4MmyK_wtGbFBC6w-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1lvL2j-00DBkD-IM; Mon, 21 Jun 2021 14:36:58 +0000
Date: Mon, 21 Jun 2021 15:36:53 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YNCkBXCo1hiQ0vFs@casper.infradead.org>
References: <162391823192.1173366.9740514875196345746.stgit@warthog.procyon.org.uk>
	<162391825688.1173366.3437507255136307904.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <162391825688.1173366.3437507255136307904.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-cachefs@redhat.com, Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v2 2/3] afs: Fix afs_write_end() to
	handle short writes
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

On Thu, Jun 17, 2021 at 09:24:16AM +0100, David Howells wrote:
> Fix afs_write_end() to correctly handle a short copy into the intended
> write region of the page.  Two things are necessary:
> 
>  (1) If the page is not up to date, then we should just return 0
>      (ie. indicating a zero-length copy).  The loop in
>      generic_perform_write() will go around again, possibly breaking up the
>      iterator into discrete chunks.
> 
>      This is analogous to commit b9de313cf05fe08fa59efaf19756ec5283af672a
>      for ceph.
> 
>  (2) The page should not have been set uptodate if it wasn't completely set
>      up by netfs_write_begin() (this will be fixed in the next patch), so
>      we need to set uptodate here in such a case.
> 
> Also remove the assertion that was checking that the page was set uptodate
> since it's now set uptodate if it wasn't already a few lines above.  The
> assertion was from when uptodate was set elsewhere.

Thanks for adding that explanation.

> +++ b/fs/afs/write.c
> @@ -119,6 +119,16 @@ int afs_write_end(struct file *file, struct address_space *mapping,
>  	_enter("{%llx:%llu},{%lx}",
>  	       vnode->fid.vid, vnode->fid.vnode, page->index);
>  
> +	len = min_t(size_t, len, thp_size(page) - from);

This line isn't necessary yet, right?

> +	if (!PageUptodate(page)) {
> +		if (copied < len) {
> +			copied = 0;
> +			goto out;
> +		}
> +
> +		SetPageUptodate(page);
> +	}
> +
>  	if (copied == 0)
>  		goto out;
>  
> @@ -133,8 +143,6 @@ int afs_write_end(struct file *file, struct address_space *mapping,
>  		write_sequnlock(&vnode->cb_lock);
>  	}
>  
> -	ASSERT(PageUptodate(page));
> -
>  	if (PagePrivate(page)) {
>  		priv = page_private(page);
>  		f = afs_page_dirty_from(page, priv);

The rest of this looks good.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

