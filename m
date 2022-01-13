Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DEB48D8DC
	for <lists+linux-cachefs@lfdr.de>; Thu, 13 Jan 2022 14:30:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642080604;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ko8chS6//cmA6XUTFvbHQbtirl0Ciiyx6dHsMjr6RKw=;
	b=iiwl4pgWPM74j8T5fCPIaD0yFCkQJJdk3t7GvZxc/91JhgFyRuzD5ag8/sTVK6SPXGaxNO
	kn4S90EcJbOh2mDzJzLJBcYXzJbJAhc1dkMYOrl6uit9qFnVf0kol2GYkdm8rdBJcSXgkP
	+sVQEE92il4xha5Tl2WrwNRSds2ebCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-r3Ar-j8eNQmZmF1r36zwxw-1; Thu, 13 Jan 2022 08:30:01 -0500
X-MC-Unique: r3Ar-j8eNQmZmF1r36zwxw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10FE664083;
	Thu, 13 Jan 2022 13:29:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3BB4753EF;
	Thu, 13 Jan 2022 13:29:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8ECE91809CB8;
	Thu, 13 Jan 2022 13:29:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20DDRPZH014713 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 13 Jan 2022 08:27:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4FC19108BD43; Thu, 13 Jan 2022 13:27:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9096105C888;
	Thu, 13 Jan 2022 13:27:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220113122155.125320-1-jefflexu@linux.alibaba.com>
References: <20220113122155.125320-1-jefflexu@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Thu, 13 Jan 2022 13:27:11 +0000
Message-ID: <1829150.1642080431@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: xiang@kernel.org, linux-cachefs@redhat.com, jlayton@kernel.org
Subject: Re: [Linux-cachefs] [PATCH v2] netfs: Make @file optional in
	netfs_alloc_read_request()
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
Content-ID: <1829149.1642080431.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> Make the @file parameter optional, and derive inode from the @folio
> parameter instead in order to support file system internal requests.
> 
> @file parameter can't be removed completely, since it also works as
> the private data of ops->init_rreq().

Note that I'm working towards a model where you would ordinarily point your
file operations and/or address-space operations directly at the netfs
functions.  This will require filesystems that use it to add a bit to their
fs-specific inode structs directly after the struct inode member.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

