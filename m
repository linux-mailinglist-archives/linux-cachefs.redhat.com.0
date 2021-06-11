Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E401C3A4AC0
	for <lists+linux-cachefs@lfdr.de>; Fri, 11 Jun 2021 23:48:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623448108;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QvG4AjAjbgJFr/dkB2SGzoOhM5oMWt7gbywVB3Amktk=;
	b=Xxt7mKpXuYQ8buM65JUkuuE3HgKMqdOPbWNxaxLndBxyMEObZ6O0UUxgNeNpTjI12IObQf
	JZsXUTBvR5HFWI+4aMuFIumgaLuxLt7+bu+Ah9UEavRLWPqnmC7cEXMVzzc+HTh97Z/Xuy
	7lVFr41bKjt7wK01Usl2mQylFxyXfrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-CWgmAl6FPRaGsoNRrMw7Rw-1; Fri, 11 Jun 2021 17:48:26 -0400
X-MC-Unique: CWgmAl6FPRaGsoNRrMw7Rw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20FE0100B3B3;
	Fri, 11 Jun 2021 21:48:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 969305C1B4;
	Fri, 11 Jun 2021 21:48:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E19181809CAD;
	Fri, 11 Jun 2021 21:48:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15BLlJgs014134 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 11 Jun 2021 17:47:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D6EF55D9E2; Fri, 11 Jun 2021 21:47:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-65.rdu2.redhat.com
	[10.10.118.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BFEF5D9D7;
	Fri, 11 Jun 2021 21:47:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YMOj1rjCOb4fQo5Y@casper.infradead.org>
References: <YMOj1rjCOb4fQo5Y@casper.infradead.org>
	<YMN/PfW2t8e5M58m@casper.infradead.org>
	<a24c3c070c9fc3529a51f00f9ccc3d0abdd0b821.camel@kernel.org>
	<20200916173854.330265-1-jlayton@kernel.org>
	<20200916173854.330265-6-jlayton@kernel.org>
	<7817f98d3b2daafe113bf8290cc8c7adbb86fe99.camel@kernel.org>
	<m2h7i45vzl.fsf@discipline.rit.edu>
	<66264.1623424309@warthog.procyon.org.uk>
	<68477.1623425725@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Fri, 11 Jun 2021 22:47:14 +0100
Message-ID: <97002.1623448034@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: Andrew W Elble <aweits@rit.edu>, Jeff Layton <jlayton@kernel.org>,
	linux-cachefs@redhat.com, pfmeec@rit.edu, ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH 5/5] ceph: fold
	ceph_update_writeable_page into ceph_write_begin
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
Content-ID: <97001.1623448034.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> Anyway, looking at netfs_write_begin(), it's wrong too, in a bunch of
> ways.  You don't need to zero out the part of the page you're going to
> copy into.

Zeroing it out isn't 'wrong', per se, just inefficient.  Fixing that needs the
filesystem to deal with it if the copy fails.

> And the condition is overly complicated which makes it
> hard to know what's going on.  Setting aside the is_cache_enabled part,
> I think you want:
> 
> 	if (offset == 0 && len >= thp_size(page))
> 		goto have_page_no_wait;
> 	if (page_offset(page) >= size) {
> 		zero_user_segments(page, 0, offset,
> 				   offset + len, thp_size(page));

There's a third case too: where the write starts at the beginning of the page
and goes to/straddles the EOF - but doesn't continue to the end of the page.

You also didn't set PG_uptodate - presumably deliberately because there's a
hole potentially containing random rubbish in the middle.

> 		goto have_page_no_wait;
> 	}
> 	... read the interesting chunks of page ...

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

