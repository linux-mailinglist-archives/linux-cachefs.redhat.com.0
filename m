Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5489E4C6F77
	for <lists+linux-cachefs@lfdr.de>; Mon, 28 Feb 2022 15:28:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646058526;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ipki+wGnRNPbnGUn5CPWMHCYqnaEApHBgjV9c1SLus4=;
	b=R9dA8ef6bT12PX4E97223M2QtpKOQIvdy2EtRLqLrH6CgFIc7hpKU15R/f/zKMRDIMxdi3
	teTQ9PkyUQ2vhY/r+jzsXmawlCmRCBBSVeYQb8xqkklFRHyONSCXC+3oAZGuhCE7BeLIE0
	7dI5uGwra1kpaga6LWTiazCqThPkzzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-hcdR79QDOUy5gMKzt8_3WA-1; Mon, 28 Feb 2022 09:28:43 -0500
X-MC-Unique: hcdR79QDOUy5gMKzt8_3WA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE4051006AA7;
	Mon, 28 Feb 2022 14:28:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 844F684949;
	Mon, 28 Feb 2022 14:28:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 297811809C98;
	Mon, 28 Feb 2022 14:28:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21SESYln012717 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 28 Feb 2022 09:28:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BEBD81057FDF; Mon, 28 Feb 2022 14:28:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.0])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7A561057FCB;
	Mon, 28 Feb 2022 14:28:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CACdtm0Z4zXpbPBLJx-=AgBRd63hp_n+U-5qc0gQDQW0c2PY7gg@mail.gmail.com>
References: <CACdtm0Z4zXpbPBLJx-=AgBRd63hp_n+U-5qc0gQDQW0c2PY7gg@mail.gmail.com>
	<164311902471.2806745.10187041199819525677.stgit@warthog.procyon.org.uk>
	<164311919732.2806745.2743328800847071763.stgit@warthog.procyon.org.uk>
	<CACdtm0YtxAUMet_PSxpg69OR9_TQbMQOzU5Kbm_5YDe_C7Nb-w@mail.gmail.com>
	<3013921.1644856403@warthog.procyon.org.uk>
To: Rohith Surabattula <rohiths.msft@gmail.com>
MIME-Version: 1.0
Date: Mon, 28 Feb 2022 14:28:27 +0000
Message-ID: <2498968.1646058507@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org, jlayton@kernel.org,
	smfrench@gmail.com, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] [RFC PATCH 7/7] cifs: Use netfslib to handle
	reads
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
Content-ID: <2498967.1646058507.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rohith Surabattula <rohiths.msft@gmail.com> wrote:

> R=00000006 READAHEAD c=00000000 ni=0 s=0 1000
>               vi-1631    [000] .....  2519.247540: netfs_read:

"c=00000000" would indicate that no fscache cookie was allocated for this
inode.

> COOKIE   VOLUME   REF ACT ACC S FL DEF
> ======== ======== === === === = == ================
> 00000002 00000001   1   0   0 - 4008 302559bec76a7924,
> 0a13e961000000000a13e96100000000d01f4719d01f4719
> 00000003 00000001   1   0   0 - 4000 0000000000640090,
> 37630162000000003763016200000000e8650f119c49f411

But we can see some cookies have been allocated.

Can you turn on:

  echo 1 >/sys/kernel/debug/tracing/events/fscache/fscache_acquire/enable

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

