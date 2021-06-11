Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 802BE3A44B6
	for <lists+linux-cachefs@lfdr.de>; Fri, 11 Jun 2021 17:12:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623424342;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L1mV2OMEF+NQRMPLYoYbHgElCWbf4ZAHShVOHfkNqB0=;
	b=VynmSOKvC783sZTwLQwsT5F+4ogX2My1vjx/zYvoaHkQCCzlXUz6BRsgrTHRHqPmeRXO5C
	HF6zsdnQckXFHCgQtuKTyC/pcSeyyNOr1LYujAxwfcMhZRLMn725CCiDWRBP+eDvXnYher
	wMCcbNpUteJA3QITHInGjieN8Gs7rEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-8PG2XwJLN1G-3OKQ8IclOg-1; Fri, 11 Jun 2021 11:12:21 -0400
X-MC-Unique: 8PG2XwJLN1G-3OKQ8IclOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30B27C7422;
	Fri, 11 Jun 2021 15:11:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37A625D9E2;
	Fri, 11 Jun 2021 15:11:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88D3A1809C80;
	Fri, 11 Jun 2021 15:11:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15BFBpAV010593 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 11 Jun 2021 11:11:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 89FD16091B; Fri, 11 Jun 2021 15:11:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-65.rdu2.redhat.com
	[10.10.118.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 302682B0A6;
	Fri, 11 Jun 2021 15:11:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <a24c3c070c9fc3529a51f00f9ccc3d0abdd0b821.camel@kernel.org>
References: <a24c3c070c9fc3529a51f00f9ccc3d0abdd0b821.camel@kernel.org>
	<20200916173854.330265-1-jlayton@kernel.org>
	<20200916173854.330265-6-jlayton@kernel.org>
	<7817f98d3b2daafe113bf8290cc8c7adbb86fe99.camel@kernel.org>
	<m2h7i45vzl.fsf@discipline.rit.edu>
To: Jeff Layton <jlayton@kernel.org>, willy@infradead.org
MIME-Version: 1.0
Date: Fri, 11 Jun 2021 16:11:49 +0100
Message-ID: <66264.1623424309@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 15BFBpAV010593
X-loop: linux-cachefs@redhat.com
Cc: Andrew W Elble <aweits@rit.edu>, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com, pfmeec@rit.edu
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <66263.1623424309.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> On Fri, 2021-06-11 at 10:14 -0400, Andrew W Elble wrote:
> > We're seeing file corruption while running 5.10, bisected to 1cc1699070bd:
> > 
> > > > +static int ceph_write_begin(struct file *file, struct address_space *mapping,
> > > > +			    loff_t pos, unsigned len, unsigned flags,
> > > > +			    struct page **pagep, void **fsdata)
> > 
> > <snip>
> > 
> > > > +		/*
> > > > +		 * In some cases we don't need to read at all:
> > > > +		 * - full page write
> > > > +		 * - write that lies completely beyond EOF
> > > > +		 * - write that covers the the page from start to EOF or beyond it
> > > > +		 */
> > > > +		if ((pos_in_page == 0 && len == PAGE_SIZE) ||
> > > > +		    (pos >= i_size_read(inode)) ||
> > 
> > Shouldn't this be '((pos & PAGE_MASK) >= i_size_read(inode)) ||' ?
> > 
> > Seems like fs/netfs/read_helper.c currently has the same issue?

That's not quite right either.  page may be larger than PAGE_MASK if
grab_cache_page_write_begin() returns a THP (if that's possible).

Maybe:

	(pos & thp_size(page) - 1) >= i_size_read(inode)

Really, we want something like thp_pos().  Maybe Willy has something like that
up his sleeve.

In fact, in netfs_write_begin(), index and pos_in_page should be calculated
after grab_cache_page_write_begin() has been called, just in case the new page
extends before the page containing the requested position.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

