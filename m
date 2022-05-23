Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3375053095C
	for <lists+linux-cachefs@lfdr.de>; Mon, 23 May 2022 08:08:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653286138;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7UZ1Im10Yb6xl5ofHxPBuB/glW2iTZqTlLIY4tRTDO8=;
	b=LP2fF/aAa82MRXeQ2CNvULvtGQnXRsAC3bQSSX27tBc4b0d1FDqj/GQmVKN1UVFtYuzs9b
	fsjdFvI30T/r+/LZFvARRKMc8RIfLffoMVJGaUEZN4q0ayGRxQ/duVMTtGjUUIUMc3/Qtd
	JG+BtTyZO1JomsvRCPXSRohotXFeIxQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-ZT3ueXBsM5GZy4k67B38ug-1; Mon, 23 May 2022 02:08:54 -0400
X-MC-Unique: ZT3ueXBsM5GZy4k67B38ug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D8DF18E5341;
	Mon, 23 May 2022 06:08:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3FB3C159B3;
	Mon, 23 May 2022 06:08:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 63960194705C;
	Mon, 23 May 2022 06:08:53 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CCB8D1947059 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 23 May 2022 06:08:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9F245C27E9D; Mon, 23 May 2022 06:08:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C42B2C27E97;
 Mon, 23 May 2022 06:08:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <e5f6fee5518ce8e1b4fc5aa7038de1617a341c2f.camel@kernel.org>
References: <e5f6fee5518ce8e1b4fc5aa7038de1617a341c2f.camel@kernel.org>
 <165296980082.3595490.3561111064004493810.stgit@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@kernel.org>, Xiubo Li <xiubli@redhat.com>
MIME-Version: 1.0
Date: Mon, 23 May 2022 07:08:49 +0100
Message-ID: <460693.1653286129@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH 1/2] netfs: ->cleanup() op is always
 given a rreq pointer now
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
Cc: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 Dominique Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <460692.1653286129.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> Do we need free_subrequest? It looks like nothing defines it in this
> series.

These two patches add stuff that's used by stuff on my netfs-lib branch, but
that's not going to be pushed this window, so I won't push these two patches
for now.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

