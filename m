Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 549AE57FDEB
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Jul 2022 12:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658746515;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6HfX+aNJoidXVM614nwroCyIgDDIn7h5BUznMJIuU5M=;
	b=ISNL0DTiLtLeteFk2JSOzVHEFv68k/l+qpYZEk9BePJ4mbAJa+gLn2iBI1malz1hpL3xFJ
	BLDzu0+3nY4QoEzgHb885CXa1HbhJR/ekwNiyNrCZyMCHUNmb9gaDyZSiaJfryIQM3KXJG
	7QI2dyDiJ+u5rB241tVlmou6T9pN8vw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-_7fY6LvLO6W4jjUsrfZVSg-1; Mon, 25 Jul 2022 06:55:12 -0400
X-MC-Unique: _7fY6LvLO6W4jjUsrfZVSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF49E1C06900;
	Mon, 25 Jul 2022 10:55:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A80F12026D64;
	Mon, 25 Jul 2022 10:55:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 43A161945D89;
	Mon, 25 Jul 2022 10:55:11 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1BAD81945D81 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 25 Jul 2022 10:55:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 05367C28130; Mon, 25 Jul 2022 10:55:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6FDEC28118;
 Mon, 25 Jul 2022 10:55:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YtlyDZEsOZHt6tRs@MiWiFi-R3L-srv>
References: <YtlyDZEsOZHt6tRs@MiWiFi-R3L-srv>
 <20220721015605.20651-1-slark_xiao@163.com>
To: Baoquan He <bhe@redhat.com>
MIME-Version: 1.0
Date: Mon, 25 Jul 2022 11:55:06 +0100
Message-ID: <2778505.1658746506@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH v2] docs: Fix typo in comment
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
Cc: linux-cachefs@redhat.com, linux-doc@vger.kernel.org, peterz@infradead.org,
 bigeasy@linutronix.de, ast@kernel.org, Slark Xiao <slark_xiao@163.com>,
 song@kernel.org, sdf@google.com, will@kernel.org, daniel@iogearbox.net,
 corbet@lwn.net, william.gray@linaro.org, john.fastabend@gmail.com,
 andrii@kernel.org, mingo@redhat.com, longman@redhat.com, dyoung@redhat.com,
 vgoyal@redhat.com, boqun.feng@gmail.com, kpsingh@kernel.org, yhs@fb.com,
 tglx@linutronix.de, haoluo@google.com, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, jolsa@kernel.org, bpf@vger.kernel.org,
 martin.lau@linux.dev
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2778503.1658746506.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Baoquan He <bhe@redhat.com> wrote:

> sed -i "s/the the /the /g" `git grep -l "the the "`

You might want to clarify the first "the" with a preceding boundary marker.
There are some English words ending in "the" that can be used as verbs, though
I'm not sure you'd find any of them here - clothe for example.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

