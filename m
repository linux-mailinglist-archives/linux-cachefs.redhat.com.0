Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 40858164D1E
	for <lists+linux-cachefs@lfdr.de>; Wed, 19 Feb 2020 18:57:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582135032;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1mQVJNC6JySRuph0q99f80aoZN7kmK9cNmn9g9+9KMM=;
	b=dDfXgt6/iU4SxI1YPfx0YpSoyR/DcWNXniq98vESGVurbX2LLXuuiNRD/VqGvyEkLVq8dw
	2JfmTJ53D0wBCAy7T06P3TbRqB6CAiuZAGg8dlbdBpEZ73+Iu1xJ2SpVZnI2URVtGLzKcJ
	UfCrE81yiE775y/YpzjCZyutYkQP/v0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-T9WwzJPkPpWjq1MZk47vjA-1; Wed, 19 Feb 2020 12:57:10 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9E518017CC;
	Wed, 19 Feb 2020 17:57:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1360B5D9E2;
	Wed, 19 Feb 2020 17:57:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94EEE18089C8;
	Wed, 19 Feb 2020 17:57:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JHuxGE022079 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 12:56:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6FD0219756; Wed, 19 Feb 2020 17:56:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-122-163.rdu2.redhat.com
	[10.10.122.163])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14251196AE;
	Wed, 19 Feb 2020 17:56:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <SH0PR01MB045873AEEA42B84D442F09028A1B0@SH0PR01MB0458.CHNPR01.prod.partner.outlook.cn>
References: <SH0PR01MB045873AEEA42B84D442F09028A1B0@SH0PR01MB0458.CHNPR01.prod.partner.outlook.cn>
To: "Yang, Lifeng" <lifeng.yang@lenovonetapp.com>
MIME-Version: 1.0
Content-ID: <232278.1582128509.1@warthog.procyon.org.uk>
From: David Howells <dhowells@redhat.com>
Date: Wed, 19 Feb 2020 17:56:55 +0000
Message-ID: <241684.1582135015@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JHuxGE022079
X-loop: linux-cachefs@redhat.com
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
Subject: Re: [Linux-cachefs] About the ceph persistent caching with fscache
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: T9WwzJPkPpWjq1MZk47vjA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Yang, Lifeng <lifeng.yang@lenovonetapp.com> wrote:

> I have a question need the consult from the ceph experts. I am the user of
> CephFS, and would like to use the persist memory to accelerate file IO and I
> found long times ago, the FSCache supports the CephFS:
>
> https://lwn.net/Articles/564294/
> 
> I wonder if the FSCache support the user mode CephFS accessing? Because I
> just see there is only kernel code update, this is might the easy question
> for you.

Note that fscache is being heavily rewritten at the moment:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-iter

Interfaces now exist that allow it to use direct I/O to the backing filesystem
and avoid the need to try to snoop the waitqueues for backing pages to come
available (which doesn't always appear to work).

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

