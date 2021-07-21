Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1E13D1500
	for <lists+linux-cachefs@lfdr.de>; Wed, 21 Jul 2021 19:20:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626888029;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zsdmez0LlPCBf5zOvkgz8QALYQO8cUWHqOp5cimFdPE=;
	b=X3JMHgZvwHJPttK0ytmr5YF94qWOJRMsj3qcXQX/rvESBOcV7mQQ6BJRVWsPmafYGO0nEG
	yGCTSyK2GYs86ez0yBUSThwHaCNHYhJKNlAtgAVa2F3sScOVWnWyYun0/k5W2f3sn7KoqE
	loJgDWBZg1CzHDxGtV1A0V2fbfi/OJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-OknYrExEPnmJwWROYk6Srw-1; Wed, 21 Jul 2021 13:20:26 -0400
X-MC-Unique: OknYrExEPnmJwWROYk6Srw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B98CD192CC41;
	Wed, 21 Jul 2021 17:20:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8018100164A;
	Wed, 21 Jul 2021 17:20:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66DFE1801028;
	Wed, 21 Jul 2021 17:20:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16LHKNbj032047 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 21 Jul 2021 13:20:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0E4685DD86; Wed, 21 Jul 2021 17:20:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-62.rdu2.redhat.com
	[10.10.112.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7BD35D9DD;
	Wed, 21 Jul 2021 17:20:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <0555748529d483fb9b69eceb56bf9ebc1efceaf1.camel@redhat.com>
References: <0555748529d483fb9b69eceb56bf9ebc1efceaf1.camel@redhat.com>
	<162687506932.276387.14456718890524355509.stgit@warthog.procyon.org.uk>
	<162687509306.276387.7579641363406546284.stgit@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@redhat.com>
MIME-Version: 1.0
Date: Wed, 21 Jul 2021 18:20:14 +0100
Message-ID: <289704.1626888014@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Subject: Re: [Linux-cachefs] [RFC PATCH 02/12] netfs: Add an iov_iter to the
	read subreq for the network fs/cache to use
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <289703.1626888014.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@redhat.com> wrote:

> > -	iov_iter_xarray(&iter, WRITE, &subreq->rreq->mapping->i_pages,
> > +	iov_iter_xarray(&iter, READ, &subreq->rreq->mapping->i_pages,
> 
> What's up with the WRITE -> READ change here? Was that a preexisting
> bug?

Actually, yes - I need to split that out and send it to Linus.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

