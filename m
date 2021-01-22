Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4131830082C
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Jan 2021 17:07:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611331623;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iXuV/CL1Wr/9cOd13tJ+0KIfNB293Tx0mhAabeCqF38=;
	b=iApBdTtdKmMj5xgf9M21VYdBSxVKQY4D3Wk/1l52gq3LJbWA8HFT4e11+JU458qqXNpetW
	+p3jHYKvBroBd3xssiz6C+vng+ICa94GkMHjPR1k1S5y0ouOWTyjMHMS4gP+4udhUOfI6M
	EijJdFprhPABUkETHX7HLgvGxs766as=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-Z_bc8tnAM2avYbBV2s_lcw-1; Fri, 22 Jan 2021 11:07:01 -0500
X-MC-Unique: Z_bc8tnAM2avYbBV2s_lcw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EED15100C664;
	Fri, 22 Jan 2021 16:06:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C21C5D6CF;
	Fri, 22 Jan 2021 16:06:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11214180954D;
	Fri, 22 Jan 2021 16:06:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10MG6tQl001023 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Jan 2021 11:06:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 75ED519CBD; Fri, 22 Jan 2021 16:06:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A07F418993;
	Fri, 22 Jan 2021 16:06:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210122160129.GB18583@fieldses.org>
References: <20210122160129.GB18583@fieldses.org>
	<20210121190937.GE20964@fieldses.org>
	<20210121174306.GB20964@fieldses.org>
	<20210121164645.GA20964@fieldses.org>
	<161118128472.1232039.11746799833066425131.stgit@warthog.procyon.org.uk>
	<1794286.1611248577@warthog.procyon.org.uk>
	<1851804.1611255313@warthog.procyon.org.uk>
	<1856291.1611259704@warthog.procyon.org.uk>
To: "J. Bruce Fields" <bfields@fieldses.org>
MIME-Version: 1.0
Date: Fri, 22 Jan 2021 16:06:46 +0000
Message-ID: <2085147.1611331606@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10MG6tQl001023
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [RFC][PATCH 00/25] Network fs helper library &
	fscache kiocb API
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2085146.1611331606.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

J. Bruce Fields <bfields@fieldses.org> wrote:

> > J. Bruce Fields <bfields@fieldses.org> wrote:
> > > So, I'm still confused: there must be some case where we know fscache
> > > actually works reliably and doesn't corrupt your data, right?
> > 
> > Using ext2/3, for example.  I don't know under what circumstances xfs, ext4
> > and btrfs might insert/remove blocks of zeros, but I'm told it can happen.
> 
> Do ext2/3 work well for fscache in other ways?

Ext3 shouldn't be a problem.  That's what I used when developing it.  I'm not
sure if ext2 supports xattrs, though.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

