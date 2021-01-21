Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A76992FF590
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Jan 2021 21:13:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611260000;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SGWsBT1ZNj6QqrcwnAdmM/HRnRoHqsuKSUoKghFVcs8=;
	b=cUlD+xuxrKfepLZ2tQjo6Zqe0jDl/NnPiqssAadpKFwx4YjOJgjkhT0wNrux2oIQJbbkZb
	T1dZuOsRFwrOxF/QDS0tZTpAV6X9e5tedF6uSSp6+tAqaBS0T6hXFgFqqPhlWWq2xOu/0N
	h/qiAsJKEUYrQ+FQBaTO0lIzKkZtUdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-ZENNBwQPMSmFfIDKVlXGvA-1; Thu, 21 Jan 2021 15:13:19 -0500
X-MC-Unique: ZENNBwQPMSmFfIDKVlXGvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF870107ACE3;
	Thu, 21 Jan 2021 20:13:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 726BA5D765;
	Thu, 21 Jan 2021 20:13:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72C0718095C7;
	Thu, 21 Jan 2021 20:13:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10LK8Wht028927 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 21 Jan 2021 15:08:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4C80650A8B; Thu, 21 Jan 2021 20:08:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D670150DD2;
	Thu, 21 Jan 2021 20:08:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210121190937.GE20964@fieldses.org>
References: <20210121190937.GE20964@fieldses.org>
	<20210121174306.GB20964@fieldses.org>
	<20210121164645.GA20964@fieldses.org>
	<161118128472.1232039.11746799833066425131.stgit@warthog.procyon.org.uk>
	<1794286.1611248577@warthog.procyon.org.uk>
	<1851804.1611255313@warthog.procyon.org.uk>
To: "J. Bruce Fields" <bfields@fieldses.org>
MIME-Version: 1.0
Date: Thu, 21 Jan 2021 20:08:24 +0000
Message-ID: <1856291.1611259704@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10LK8Wht028927
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
Content-ID: <1856290.1611259704.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

J. Bruce Fields <bfields@fieldses.org> wrote:

> > J. Bruce Fields <bfields@fieldses.org> wrote:
> > 
> > > > Fixing this requires a much bigger overhaul of cachefiles than this patchset
> > > > performs.
> > > 
> > > That sounds like "sometimes you may get file corruption and there's
> > > nothing you can do about it".  But I know people actually use fscache,
> > > so it must be reliable at least for some use cases.
> > 
> > Yes.  That's true for the upstream code because that uses bmap.
> 
> Sorry, when you say "that's true", what part are you referring to?

Sometimes, theoretically, you may get file corruption due to this.

> > I'm switching
> > to use SEEK_HOLE/SEEK_DATA to get rid of the bmap usage, but it doesn't change
> > the issue.
> > 
> > > Is it that those "bridging" blocks only show up in certain corner cases
> > > that users can arrange to avoid?  Or that it's OK as long as you use
> > > certain specific file systems whose behavior goes beyond what's
> > > technically required by the bamp or seek interfaces?
> > 
> > That's a question for the xfs, ext4 and btrfs maintainers, and may vary
> > between kernel versions and fsck or filesystem packing utility versions.
> 
> So, I'm still confused: there must be some case where we know fscache
> actually works reliably and doesn't corrupt your data, right?

Using ext2/3, for example.  I don't know under what circumstances xfs, ext4
and btrfs might insert/remove blocks of zeros, but I'm told it can happen.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

