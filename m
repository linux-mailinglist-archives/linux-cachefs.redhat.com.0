Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 746D73A5FBC
	for <lists+linux-cachefs@lfdr.de>; Mon, 14 Jun 2021 12:09:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623665377;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y0qSVFXGaCXwns9Abp0CMPoJz08ImyCEtYKczyu3RK0=;
	b=is4vn9V5DG8TVelY1Gswk1uot5qn5ga8T9893dp/Z7uNSXdGmsaM3BQPvapiqttb765ELk
	XgsseTFvnNe9NshFpcNHbq6YLr+TO54LZThGunEvCziz3JTx8V2XuF/ixBLR4ftzZnHoAS
	duSfQTPP23wQob5e8i1PAK7Nwdaw+zQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-IuSapxaoOwCekrQrDD12ow-1; Mon, 14 Jun 2021 06:09:36 -0400
X-MC-Unique: IuSapxaoOwCekrQrDD12ow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB639EC1B7;
	Mon, 14 Jun 2021 10:09:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFC9360C0F;
	Mon, 14 Jun 2021 10:09:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00F1E46F59;
	Mon, 14 Jun 2021 10:09:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15EA4tt8011697 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 14 Jun 2021 06:04:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B97FB1691E; Mon, 14 Jun 2021 10:04:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-65.rdu2.redhat.com
	[10.10.118.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E8BD70589;
	Mon, 14 Jun 2021 10:04:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210613233345.113565-1-jlayton@kernel.org>
References: <20210613233345.113565-1-jlayton@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Jun 2021 11:04:53 +0100
Message-ID: <338981.1623665093@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: Andrew W Elble <aweits@rit.edu>, willy@infradead.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <338980.1623665093.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> +/**
> + * prep_noread_page - prep a page for writing without reading first

It's a static function, so I'm not sure it needs the kernel doc marker.

It also needs prefixing with "netfs_".

> +	/* pos beyond last page in the file */
> +	if (index > ((i_size - 1) / thp_size(page)))
> +		goto zero_out;

thp_size() is not a constant, so this gets you a DIV instruction.

Why not:

	if (page_offset(page) >= i_size)

or maybe:

	if (pos - offset >= i_size)

> +	zero_user_segments(page, 0, offset, offset + len, thp_size(page));

If you're going to leave a hole in the file, this will break afs, so this
patch needs to deal with that too (basically if copied < len, then the
remainder needs clearing, give or take len being trimmed to the end of the
page).  I can look at adding that.

Matthew Wilcox <willy@infradead.org> wrote:

> > +	size_t offset = offset_in_page(pos);
> 
> offset_in_thp(page, pos);

I can make this change too.

(btw, can offset_in_thp() have it's second arg renamed to 'pos', not just 'p'?
 'p' is normally used to indicate a pointer of some sort).

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

