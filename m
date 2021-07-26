Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9735C3D56D4
	for <lists+linux-cachefs@lfdr.de>; Mon, 26 Jul 2021 11:52:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627293164;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Do93TJlYYbso1C/0S0UFSoLsUE5EpcLEPEDATkn9faY=;
	b=J9PPcbhXylFi/lY0CH83waGh9DOoJjBbcuPAzVjp5XJwMuLOeeMTKslYuFcqfks1hL5A/U
	Sd3xpD4FPFZRG22i3dqKOVpOYaW2YkvSaQ0JSazP2Etk7askrunvbsPVQmF0C13r+u8izh
	S4Sn2t0nX1VrMSUsEFMtklOpgQgg5m8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-Pdv6M-_1Ojq2z0GTvhtx8Q-1; Mon, 26 Jul 2021 05:52:43 -0400
X-MC-Unique: Pdv6M-_1Ojq2z0GTvhtx8Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19D7494F01;
	Mon, 26 Jul 2021 09:52:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25DEA19D9F;
	Mon, 26 Jul 2021 09:52:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 584C8180BAD0;
	Mon, 26 Jul 2021 09:52:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16Q9iifK005753 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 05:44:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 95A5E5C261; Mon, 26 Jul 2021 09:44:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.22.16.89])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 61BB85C1D1;
	Mon, 26 Jul 2021 09:44:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <35ecb577315f486f1636b2316c2051ad004f6f7b.camel@redhat.com>
References: <35ecb577315f486f1636b2316c2051ad004f6f7b.camel@redhat.com>
	<162687506932.276387.14456718890524355509.stgit@warthog.procyon.org.uk>
	<162687508008.276387.6418924257569297305.stgit@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@redhat.com>
MIME-Version: 1.0
Date: Mon, 26 Jul 2021 10:44:35 +0100
Message-ID: <812200.1627292675@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Shyam Prasad N <nspmangalore@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	devel@lists.orangefs.org, Mike Marshall <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] [RFC PATCH 01/12] afs: Sort out symlink reading
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
Content-ID: <812199.1627292675.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@redhat.com> wrote:

> > -static int afs_symlink_readpage(struct page *page)
> > +static int afs_symlink_readpage(struct file *file, struct page *page)
> >  {
> >  	struct afs_vnode *vnode = AFS_FS_I(page->mapping->host);
> >  	struct afs_read *fsreq;
> 
> 
> I wonder...would you be better served here by not using page_readlink
> for symlinks and instead use simple_get_link and roll your own readlink
> operation. It seems a bit more direct, and AFS seems to be the only
> caller of page_readlink.

Maybe.  At some point it will need to go through netfs_readpage() so that it
will get cached and maybe encrypted.  Possibly there should be a
netfs_readlink().  AFS directories too will at some point need to go through
netfs_readahead() or similar.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

