Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE4E478BF8
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Dec 2021 14:04:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639746261;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9bsWfmWY1aZxE6kE15j9SiXgO+OJIB8FM8p1Wv8m1lw=;
	b=AufgEu2uatGqa7OG1ukAmxGT13+GOiha3VQ8vs/B011duafj0mpIk4/z0ZWUS1u3iraMIJ
	zh3CncNWSK8FjrLlJUtqDc8tdRVlhRX1ZXtZvP6lFwOjcB7LGWfF/N95SobApAZvxN6Ppx
	QQ6+vrGZwyhTT3Xp/gpm8bB1MGWCGLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-oBAYZI3pO6WGGToSxvKLeQ-1; Fri, 17 Dec 2021 08:04:17 -0500
X-MC-Unique: oBAYZI3pO6WGGToSxvKLeQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 757B4801962;
	Fri, 17 Dec 2021 13:04:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16709196FF;
	Fri, 17 Dec 2021 13:04:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 691205004E;
	Fri, 17 Dec 2021 13:04:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BHD1Oe5014233 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 17 Dec 2021 08:01:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B33FB5C3E0; Fri, 17 Dec 2021 13:01:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D0FA5F714;
	Fri, 17 Dec 2021 13:01:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20211216094426.2083802-6-alexandre.ghiti@canonical.com>
References: <20211216094426.2083802-6-alexandre.ghiti@canonical.com>
	<20211216094426.2083802-1-alexandre.ghiti@canonical.com>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Date: Fri, 17 Dec 2021 13:01:21 +0000
Message-ID: <1956456.1639746081@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BHD1Oe5014233
X-loop: linux-cachefs@redhat.com
Cc: linux-doc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	Jonathan Corbet <corbet@lwn.net>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH v2 5/6] Documentation, arch,
	fs: Remove leftovers from fscache object list
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1956455.1639746081.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Alexandre,

>  Documentation/filesystems/caching/fscache.rst | 89 -------------------
> ...
>  fs/fscache/object.c                           |  3 -
>  fs/fscache/proc.c                             | 12 ---

Can you please drop all of the fscache bits?  They're dealt with by my
fscache-rewrite patchset that I'm proposing for the next merge window[1].

David

[1] https://lore.kernel.org/r/163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk/

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

