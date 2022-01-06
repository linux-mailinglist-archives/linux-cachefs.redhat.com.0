Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A27E94868FA
	for <lists+linux-cachefs@lfdr.de>; Thu,  6 Jan 2022 18:44:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641491057;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IO/1eIQAtiX5AbipbYO5DPLEGvFRXA3ROOf+y520MiQ=;
	b=gDwIZXK31SVNvcKHg1t/SFYkmZObPf+4pCaBvkp1Wix5NhPJnZjoofzIm3dfsXIr7Vbdf1
	e42YejVM2OIWaxKeSQAEZ4D+UYnWJzNmQMdjLOZWR9Myh4o2Od6nwgE1nvHAM5Je/NV+Yq
	abZAWVLvFs/CVjf5bHSZs1jSkU9HwdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-VURpyomHN2OchDKTa5FCSQ-1; Thu, 06 Jan 2022 12:44:14 -0500
X-MC-Unique: VURpyomHN2OchDKTa5FCSQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F30E9392C;
	Thu,  6 Jan 2022 17:44:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32F077E8FC;
	Thu,  6 Jan 2022 17:44:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E289F4BB7C;
	Thu,  6 Jan 2022 17:44:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 206Hi87X010758 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 6 Jan 2022 12:44:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9CF0677642; Thu,  6 Jan 2022 17:44:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E22B777479;
	Thu,  6 Jan 2022 17:44:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <568749bd7cc02908ecf6f3d6a611b6f9cf5c4afd.camel@kernel.org>
References: <568749bd7cc02908ecf6f3d6a611b6f9cf5c4afd.camel@kernel.org>
	<164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
	<164021543872.640689.14370017789605073222.stgit@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Thu, 06 Jan 2022 17:44:04 +0000
Message-ID: <2856724.1641491044@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 40/68] cachefiles: Implement cache
	registration and withdrawal
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2856723.1641491044.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> > +	/* check parameters */
> > +	ret = -EOPNOTSUPP;
> > +	if (d_is_negative(root) ||
> > +	    !d_backing_inode(root)->i_op->lookup ||
> > +	    !d_backing_inode(root)->i_op->mkdir ||
> > +	    !(d_backing_inode(root)->i_opflags & IOP_XATTR) ||
> > +	    !root->d_sb->s_op->statfs ||
> > +	    !root->d_sb->s_op->sync_fs ||
> > +	    root->d_sb->s_blocksize > PAGE_SIZE)
> > +		goto error_unsupported;
> > +
> 
> That's quite a collection of tests.
> 
> Most are obvious, but some comments explaining the need for others would
> not be a bad thing. In particular, why is s_blocksize > PAGE_SIZE
> unsupported?

It can't do page-sized DIO requests to a filesystem with a block size larger
than a page.  In the future I can work around that in conjunction with
netfslib by expanding read and write sizes.

> Also, should you vet whether the fs supports i_op->tmpfile here ?

That's a good idea.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

