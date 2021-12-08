Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C83A46DC8C
	for <lists+linux-cachefs@lfdr.de>; Wed,  8 Dec 2021 20:55:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638993350;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EIZ3rHQhtoDjRy5ppgoYvHgIPyAkDeuFrFi2gLi0QG4=;
	b=WYMrOciNmWrHz6EqnJ0zJbJgfpXdeBgVckk4p8eCkkAz4/Fvsqki1DJt7b8K/0fiHT3n5U
	6B1Zexa/I0Pslsf9LwOSPvL6GWO9EcufKM5bbOMZIGW/5Ono8PGswGla8iLlVTuP3YQMH1
	mEugdo9s1tjQtLeJotZsCaBI2qxlj74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450--5-4Na8PP2i3rvR58PauLQ-1; Wed, 08 Dec 2021 14:55:48 -0500
X-MC-Unique: -5-4Na8PP2i3rvR58PauLQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B0F485B663;
	Wed,  8 Dec 2021 19:55:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F9351002390;
	Wed,  8 Dec 2021 19:55:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A2521809CB8;
	Wed,  8 Dec 2021 19:55:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B8JtaAk023305 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 8 Dec 2021 14:55:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4280579445; Wed,  8 Dec 2021 19:55:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1C475C1C5;
	Wed,  8 Dec 2021 19:55:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHC9VhTP-HbRU1z66MOkSyw9w7vhK7Vq8p0FrxVfEX-+tSD43A@mail.gmail.com>
References: <CAHC9VhTP-HbRU1z66MOkSyw9w7vhK7Vq8p0FrxVfEX-+tSD43A@mail.gmail.com>
	<163898788970.2840238.15026995173472005588.stgit@warthog.procyon.org.uk>
To: Paul Moore <paul@paul-moore.com>
MIME-Version: 1.0
Date: Wed, 08 Dec 2021 19:55:12 +0000
Message-ID: <2846548.1638993312@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, selinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, kolga@netapp.com,
	linux-security-module@vger.kernel.org, linux-cachefs@redhat.com,
	viro@zeniv.linux.org.uk, casey@schaufler-ca.com,
	linux-fsdevel@vger.kernel.org, anna.schumaker@netapp.com
Subject: Re: [Linux-cachefs] [RFC PATCH 1/2] security: Remove
	security_add_mnt_opt() as it's unused
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
Content-ID: <2846547.1638993312.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Paul Moore <paul@paul-moore.com> wrote:

> There is already a patch in the selinux/next tree which does this.

Looks pretty much identical to mine.  Feel free to add:

	Reviewed-by: David Howells <dhowells@redhat.com>

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

