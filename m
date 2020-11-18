Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFEB2B8005
	for <lists+linux-cachefs@lfdr.de>; Wed, 18 Nov 2020 16:03:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605711791;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NxnrHBOumTb9HeH/1MF9jJzTMcXlW1/eWKLJqeBOi/Q=;
	b=QYWIjywMFbNzADiWdQQnSN+QMFK4iPgq00CcOcfbwGSr4ArtwRZq8hwOQgxDZS46d2knqY
	fuUR5ZGy9PNijon5oUsPZCWnDk471UOpRQvnLfcY/WMTnXTuF/V+6DMmkPb4F9RR6N16jA
	77Tm0eLJDaNzepCAorSBpkAHt0w3wYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316--NMWB21QOdKve9Am1DRWYQ-1; Wed, 18 Nov 2020 10:03:08 -0500
X-MC-Unique: -NMWB21QOdKve9Am1DRWYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82A9D100C66A;
	Wed, 18 Nov 2020 15:03:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7316160BE2;
	Wed, 18 Nov 2020 15:03:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D40285813D;
	Wed, 18 Nov 2020 15:03:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AIF33I2017331 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 18 Nov 2020 10:03:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4B6471002382; Wed, 18 Nov 2020 15:03:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-246.rdu2.redhat.com
	[10.10.112.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1ACB510016DB;
	Wed, 18 Nov 2020 15:02:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20201118141649.GA14211@nautica>
References: <20201118141649.GA14211@nautica> <20201118124826.GA17850@nautica>
	<1514086.1605697347@warthog.procyon.org.uk>
	<1561011.1605706707@warthog.procyon.org.uk>
To: Dominique Martinet <asmadeus@codewreck.org>
MIME-Version: 1.0
Date: Wed, 18 Nov 2020 15:02:58 +0000
Message-ID: <1787400.1605711778@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net
Subject: Re: [Linux-cachefs] [PATCH] 9p: Convert to new fscache API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1787399.1605711778.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dominique Martinet <asmadeus@codewreck.org> wrote:

> I take it the read helper would just iterate as long as there's data
> still required to read, writing from THPs wouldn't do that?

Yep.  As long as you read some data, the helper will call you again if you
didn't read everything.  subreq->transferred keeps track of what has been read
so far.  You can also tell the helper just to clear the rest by setting
NETFS_SREQ_CLEAR_TAIL.

The helper tries to hide the pages from you as far as possible.  Using
ITER_XARRAY hides that even more.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

