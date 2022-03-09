Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 160E14D3CE5
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 23:28:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646864885;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sUwwYvGnEmpU43hNtuiJCv1omLv0Fs8IZy3yztjEUEE=;
	b=BAswWR1cInqbIUuKjSDZBSE8oE1GM7Xnj3hrwe8qoZQI1z7YqZ8JAeik2rGjUuiQdWZElt
	Ak8xJqx4Skuwmf+9d6vDzHKz8gWtAZ535UJ3O5KIrcMPXKjM8x3qHe7CKgbwJq/IawExEo
	T6j56lhTBPnDIQriBphCwHMWTkMDJEQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-Uptd4N4QOYKr7DwO7L3i7g-1; Wed, 09 Mar 2022 17:28:02 -0500
X-MC-Unique: Uptd4N4QOYKr7DwO7L3i7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F40A801585;
	Wed,  9 Mar 2022 22:28:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30BDB400E86E;
	Wed,  9 Mar 2022 22:28:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D596E195354C;
	Wed,  9 Mar 2022 22:28:00 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D36E8194F4AE for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  9 Mar 2022 22:27:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5671545CA8; Wed,  9 Mar 2022 22:27:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB20E4E2AE;
 Wed,  9 Mar 2022 22:27:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2ebfd2f772ceef605896e58bbd0e733e1413ff71.camel@kernel.org>
References: <2ebfd2f772ceef605896e58bbd0e733e1413ff71.camel@kernel.org>
 <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
 <164678219305.1200972.6459431995188365134.stgit@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Wed, 09 Mar 2022 22:27:51 +0000
Message-ID: <1841545.1646864871@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Subject: Re: [Linux-cachefs] [PATCH v2 18/19] netfs: Keep track of the
 actual remote file size
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
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 Dominique Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1841544.1646864871.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> This seems like something useful, but I wonder if it'll need some sort
> of serialization vs. concurrent updates.

Quite possibly, though that may be something that we have to delegate to the
network filesystem.  kafs, for instance, performs local serialisation of
StoreData RPCs to any given inode because the server will exclusively lock the
remote vnode around the write-to-disk and callback break (ie. change
notification) phases.  This does not preclude, however, another client making
a change whilst the local lock is held.  Of course, in such a case, we're into
conflict resolution and may end up invalidating the local copy.

> Can we assume that netfs itself will never call netfs_resize_file?

Probably.  Depends on how truncation gets handled.

> Ceph already has some pretty complicated size tracking, since it can get
> async notifications of size changes from the MDS. We'll have to consider
> how to integrate this with what it does. Probably this will replace one
> (or more?) of its fields.

ceph's i_reported_size maybe?  cifs has server_eof.

> We may need to offer up some guidance wrt locking.

i_lock may be a good fit.  I wonder if it's worth at some point moving i_lock
to being a seqlock so that various values ordinarily protected by it are
accessible using read_seqbegin().

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

