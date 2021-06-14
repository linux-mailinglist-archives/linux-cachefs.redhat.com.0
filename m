Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 08DCA3A6736
	for <lists+linux-cachefs@lfdr.de>; Mon, 14 Jun 2021 14:54:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-MTOkjAl2M929oKbYhgloeg-1; Mon, 14 Jun 2021 08:54:50 -0400
X-MC-Unique: MTOkjAl2M929oKbYhgloeg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B44428015F5;
	Mon, 14 Jun 2021 12:54:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF6276060F;
	Mon, 14 Jun 2021 12:54:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB4F41809CAC;
	Mon, 14 Jun 2021 12:54:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15ECshm8028968 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 14 Jun 2021 08:54:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C0A1200E21A; Mon, 14 Jun 2021 12:54:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 773F7201EF59
	for <linux-cachefs@redhat.com>; Mon, 14 Jun 2021 12:54:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CB14805F44
	for <linux-cachefs@redhat.com>; Mon, 14 Jun 2021 12:54:40 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-519-V3AO1g4DMGOCxKtrcr3THw-1; Mon, 14 Jun 2021 08:54:38 -0400
X-MC-Unique: V3AO1g4DMGOCxKtrcr3THw-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lsm6b-005Qyl-6c; Mon, 14 Jun 2021 12:54:20 +0000
Date: Mon, 14 Jun 2021 13:54:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YMdReUyU60dkNWEb@casper.infradead.org>
References: <20210613233345.113565-1-jlayton@kernel.org>
	<398005.1623673532@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <398005.1623673532@warthog.procyon.org.uk>
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
Cc: Andrew W Elble <aweits@rit.edu>, Jeff Layton <jlayton@kernel.org>,
	linux-cachefs@redhat.com, pfmeec@rit.edu, idryomov@gmail.com,
	ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] netfs: fix test for whether we can skip
 read when writing beyond EOF
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

On Mon, Jun 14, 2021 at 01:25:32PM +0100, David Howells wrote:
> +	/* Full page write */
> +	if (offset == 0 && len >= thp_size(page))
> +		return true;
> +
> +	/* pos beyond last page in the file */
> +	if (pos - offset >= i_size)
> +		goto zero_out;
> +
> +	/* Write that covers from the start of the page  to EOF or beyond */

spurious double space between page and to.

> @@ -1090,13 +1119,8 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
>  	 * within the cache granule containing the EOF, in which case we need
>  	 * to preload the granule.
>  	 */
> -	size = i_size_read(inode);
>  	if (!ops->is_cache_enabled(inode) &&
> -	    ((pos_in_page == 0 && len == thp_size(page)) ||
> -	     (pos >= size) ||
> -	     (pos_in_page == 0 && (pos + len) >= size))) {
> -		netfs_clear_thp(page);
> -		SetPageUptodate(page);
> +	    netfs_prep_noread_page(page, pos, len)) {

I don't like the name ... netfs_skip_page_read()?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

