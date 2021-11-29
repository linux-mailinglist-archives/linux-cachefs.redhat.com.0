Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD728462387
	for <lists+linux-cachefs@lfdr.de>; Mon, 29 Nov 2021 22:42:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638222152;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mKvoGVBJ8AiotPS0fuUsiHBziUigia8KzDSkK0IacxM=;
	b=iphdD/t/eZv7+rqGCUac4dhXw7ziZD0530DtWkIc1iy+wMUKZLaoevTTf6uVAdkyghDjvu
	9uj+z4RIhJWDuwkT6BXpATi3A9DCnjSHqHeZv0hVSBHWoOdZK+hsEenps/IHkS48k9ueyB
	tlBuSjF8gfmjes7R3SnGsIPa5hGnr14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-vvRkAdDPNK-rFVRCBqsVgQ-1; Mon, 29 Nov 2021 16:42:29 -0500
X-MC-Unique: vvRkAdDPNK-rFVRCBqsVgQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97EB784BA54;
	Mon, 29 Nov 2021 21:42:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8417260BF4;
	Mon, 29 Nov 2021 21:42:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E084B1809C89;
	Mon, 29 Nov 2021 21:42:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ATLexnI010702 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 29 Nov 2021 16:40:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 82EAD60C13; Mon, 29 Nov 2021 21:40:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 21F1160BF4;
	Mon, 29 Nov 2021 21:40:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <163819627469.215744.3603633690679962985.stgit@warthog.procyon.org.uk>
References: <163819627469.215744.3603633690679962985.stgit@warthog.procyon.org.uk>
	<163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
To: linux-cachefs@redhat.com
MIME-Version: 1.0
Date: Mon, 29 Nov 2021 21:40:55 +0000
Message-ID: <302431.1638222055@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 35/64] cachefiles: Add security
	derivation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <302430.1638222055.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I missed out the patch description:

    cachefiles: Add security derivation
    
    Implement code to derive a new set of creds for the cachefiles to use when
    making VFS or I/O calls and to change the auditing info since the
    application interacting with the network filesystem is not accessing the
    cache directly.  Cachefiles uses override_creds() to change the effective
    creds temporarily.
    
    set_security_override_from_ctx() is called to derive the LSM 'label' that
    the cachefiles driver will act with.  set_create_files_as() is called to
    determine the LSM 'label' that will be applied to files and directories
    created in the cache.  These functions alter the new creds.
    
    Also implement a couple of functions to wrap the calls to begin/end cred
    overriding.
    
    Signed-off-by: David Howells <dhowells@redhat.com>
    cc: linux-cachefs@redhat.com

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

