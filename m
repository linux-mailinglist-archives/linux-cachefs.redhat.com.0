Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 669923A57EC
	for <lists+linux-cachefs@lfdr.de>; Sun, 13 Jun 2021 13:09:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-ZQMyw9iaOYOawBDMylNhaw-1; Sun, 13 Jun 2021 07:09:30 -0400
X-MC-Unique: ZQMyw9iaOYOawBDMylNhaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15C88185060A;
	Sun, 13 Jun 2021 11:09:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B30F934B4B;
	Sun, 13 Jun 2021 11:09:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6916A4EBC6;
	Sun, 13 Jun 2021 11:09:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15DB53F2016029 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 13 Jun 2021 07:05:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BCD682EF8A; Sun, 13 Jun 2021 11:05:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B392D44006
	for <linux-cachefs@redhat.com>; Sun, 13 Jun 2021 11:05:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27EBE80122D
	for <linux-cachefs@redhat.com>; Sun, 13 Jun 2021 11:05:01 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-242-zj-PkzzFOpiEqztnCWuGkg-1; Sun, 13 Jun 2021 07:04:59 -0400
X-MC-Unique: zj-PkzzFOpiEqztnCWuGkg-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lsNuw-004Tha-W8; Sun, 13 Jun 2021 11:04:42 +0000
Date: Sun, 13 Jun 2021 12:04:38 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <YMXmRo17oy8fDn2b@casper.infradead.org>
References: <YMS4TOw8txQQ7VGr@casper.infradead.org>
	<20210612183531.17074-1-jlayton@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210612183531.17074-1-jlayton@kernel.org>
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
Cc: Andrew W Elble <aweits@rit.edu>, stable@vger.kernel.org,
	linux-cachefs@redhat.com, pfmeec@rit.edu,
	ceph-devel@vger.kernel.org, idryomov@gmail.com
Subject: Re: [Linux-cachefs] [PATCH v3] ceph: fix write_begin optimization
 when write is beyond EOF
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 12, 2021 at 02:35:31PM -0400, Jeff Layton wrote:
>  
> +/**
> + * prep_noread_page - prep a page for writing without reading first
> + * @page: page being prepared
> + * @pos: starting position for the write
> + * @len: length of write
> + *
> + * In some cases we don't need to read at all:
> + * - full page write
> + * - file is currently zero-length
> + * - write that lies in a page that is completely beyond EOF
> + * - write that covers the the page from start to EOF or beyond it
> + *
> + * If any of these criteria are met, then zero out the unwritten parts
> + * of the page and return true. Otherwise, return false.
> + */
> +static bool prep_noread_page(struct page *page, loff_t pos, unsigned int len)
> +{
> +	struct inode *inode = page->mapping->host;
> +	loff_t i_size = i_size_read(inode);
> +	pgoff_t index = pos / PAGE_SIZE;
> +	int pos_in_page = pos & ~PAGE_MASK;

Like the helper.  A couple of minor tweaks ...

	size_t offset = offset_in_page(pos);

> +	/* full page write */
> +	if (pos_in_page == 0 && len == PAGE_SIZE)
> +		goto zero_out;

At some point, we're going to need to pass the full len to
->write_begin, so that we can decide whether it's worth allocating
more than a single page.  Could you make 'len' here size_t, and
check for len >= PAGE_SIZE?

(with the current code, the offset of 0 is a redundant check, but
I'd rather see this future-proofed).

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

