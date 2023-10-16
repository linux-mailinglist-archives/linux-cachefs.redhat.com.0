Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4A47CAEEF
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Oct 2023 18:20:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697473200;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VAXr/DDmWQ///6lzZa8hFGzhH4tDzXrz68LCtxxkpek=;
	b=FffgR1OwIxm03zslU07zmgEVFYvGz5pcHpC2rsD3UbPoR6yVxi4WG8xdApuGMXZueSiFar
	s53SieJUGfbnU+/7uUiRriPq5HQrYbdlZ41KeHMpfAzdlSBfyyNMwz9ephXQRiNH8pQC5v
	BT7QmVJsBtw/DOXJCJJDjWiXFWpir7s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-s599lP8bOIebuwM1sbHs_Q-1; Mon, 16 Oct 2023 12:19:57 -0400
X-MC-Unique: s599lP8bOIebuwM1sbHs_Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D4CD858281;
	Mon, 16 Oct 2023 16:19:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BAC38492BFC;
	Mon, 16 Oct 2023 16:19:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7C51C194658C;
	Mon, 16 Oct 2023 16:19:55 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4B7131946587 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 16 Oct 2023 16:19:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2027A25C9; Mon, 16 Oct 2023 16:19:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A802825C8;
 Mon, 16 Oct 2023 16:19:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <be2434a2d51900b9e51d8bf0fe5a8b82e3f1a879.camel@kernel.org>
References: <be2434a2d51900b9e51d8bf0fe5a8b82e3f1a879.camel@kernel.org>
 <20231013160423.2218093-1-dhowells@redhat.com>
 <20231013160423.2218093-9-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Mon, 16 Oct 2023 17:19:51 +0100
Message-ID: <2840974.1697473191@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Subject: Re: [Linux-cachefs] [RFC PATCH 08/53] netfs: Add rsize to
 netfs_io_request
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
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 Steve French <smfrench@gmail.com>, linux-cachefs@redhat.com,
 linux-mm@kvack.org, netdev@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, v9fs@lists.linux.dev,
 Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
 Christian Brauner <christian@brauner.io>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2840973.1697473191.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> > +	rreq->rsize = 4 * 1024 * 1024;
> >  	return 0;
> ...
> > +	rreq->rsize = 1024 * 1024;
> > +
> 
> Holy magic numbers, batman! I think this deserves a comment that
> explains how you came up with these values.

Actually, that should be set to something like the object size for ceph.

> Also, do 9p and cifs not need this for some reason?

At this point, cifs doesn't use netfslib, so that's implemented in a later
patch in this series.

9p does need setting, but I haven't tested that yet.  It probably needs
setting to 1MiB as I think that's the maximum the 9p transport can handle.

But in the case of cifs, this is actually dynamic, depending on how many
credits we can obtain.  The same may be true of ceph, though I'm not entirely
clear on that as yet.

For afs, the maximum [rw]size the protocol supports is actually something like
281350422593565 (ie. (65535-28) * (2^32-1)) minus a few bytes, but that's
probably not a good idea.  I might be best setting it at something like 256KiB
as that's what OpenAFS uses.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

