Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B9E7CAF44
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Oct 2023 18:31:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697473885;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3lPD6G0NNg37P/9U3cEgV1ilwRLC4MrASsJz4H3o8EU=;
	b=U0gi+7JtchAW5Z4IGOojVXQhQwww5Db0aBvoiroLG2OT4WC3odK1OXG60tsP6yD6JrQhad
	QdQq1rI1AtfHrByxo5jespJ8hVucq2iHnbBRhiqlbfwenFQq7vZ1G6pZiJM8cdzru7L5eX
	zPqc4fsxzIux4uKn/CIobe7Y/XYlgEI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-FirIr9KPMWS_kDXm8nnZxw-1; Mon, 16 Oct 2023 12:31:18 -0400
X-MC-Unique: FirIr9KPMWS_kDXm8nnZxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F60881DA09;
	Mon, 16 Oct 2023 16:31:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6898CC15BBC;
	Mon, 16 Oct 2023 16:31:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 16BE1194658C;
	Mon, 16 Oct 2023 16:31:17 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6B2511946587 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 16 Oct 2023 16:31:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 54A15492BEF; Mon, 16 Oct 2023 16:31:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7B49492BEE;
 Mon, 16 Oct 2023 16:31:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <11ec6f637698feb04963c6a7c39a5ca80af95464.camel@kernel.org>
References: <11ec6f637698feb04963c6a7c39a5ca80af95464.camel@kernel.org>
 <20231013155727.2217781-1-dhowells@redhat.com>
 <20231013155727.2217781-3-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Mon, 16 Oct 2023 17:31:12 +0100
Message-ID: <2841426.1697473872@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Subject: Re: [Linux-cachefs] [RFC PATCH 02/53] netfs: Track the fpos above
 which the server has no data
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-kernel@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Dominique Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <smfrench@gmail.com>,
 linux-cachefs@redhat.com, linux-mm@kvack.org, netdev@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, v9fs@lists.linux.dev,
 Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
 Christian Brauner <christian@brauner.io>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2841425.1697473872.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> >  (7) If stored data is culled from the local cache, we must set zero_point
> >      above that if the data also got written to the server.
> 
> When you say culled here, it sounds like you're just throwing out the
> dirty cache without writing the data back. That shouldn't be allowed
> though, so I must be misunderstanding what you mean here. Can you
> explain?

I meant fscache specifically.  Too many caches - and some of them with the
same names!

> >  (8) If dirty data is written back to the server, but not the local cache,
> >      we must set zero_point above that.
> 
> How do you write back without writing to the local cache? I'm guessing
> this means you're doing a non-buffered write?

I meant fscache.  fscache can decline to honour a request to store data.

> > +		if (size != i_size) {
> > +			truncate_pagecache(&vnode->netfs.inode, size);
> > +			netfs_resize_file(&vnode->netfs, size);
> > +			fscache_resize_cookie(afs_vnode_cache(vnode), size);
> > +		}
> 
> Isn't this an existing bug? AFS is not setting remote_i_size in the
> setattr path currently? I think this probably ought to be done in a
> preliminary AFS patch.

It is being set.  afs_apply_status() sets it.  This is called by
afs_vnode_commit_status() which is called from afs_setattr_success().  The
value isn't updated until we get the return status from the server that
includes the new value.

> > +	loff_t			zero_point;	/* Size after which we assume there's no data
> > +						 * on the server */
> 
> While I understand the concept, I'm not yet sure I understand how this
> new value will be used. It might be better to merge this patch in with
> the patch that adds the first user of this data.

I'll consider it.  At least it might make sense to move them adjacent to each
other in the series.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

