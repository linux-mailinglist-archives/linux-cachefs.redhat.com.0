Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8545F57FFD2
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Jul 2022 15:32:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658755931;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LRrrmLvlGBKOiuLuATPWSTJ3PTVX0YDIpKrAyJY5n1g=;
	b=cAyfCvvX3eSbtYF7n7x5SRkC4X9cZmmtm4PTU/Gh13Ep0Zx/+dzh+VL6R4EFo7BOdYrFM3
	kbyPaJfMELSjB6LpWgu/qag34P2Nkdr/BrD/ZbAoq1V8xlibuasWrz+USv1DXFbNOUb39Z
	KYzJdTc/s57xxH427vE8ssP7ibr8cMs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-5YOn_bgRPZmkC2VKwwQy4w-1; Mon, 25 Jul 2022 09:32:10 -0400
X-MC-Unique: 5YOn_bgRPZmkC2VKwwQy4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 231283C0F365;
	Mon, 25 Jul 2022 13:32:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DBD8909FE;
	Mon, 25 Jul 2022 13:32:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 019EF1945D87;
	Mon, 25 Jul 2022 13:32:09 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BA4F11945D81 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 25 Jul 2022 13:32:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8734340C1288; Mon, 25 Jul 2022 13:32:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from localhost (ovpn-12-90.pek2.redhat.com [10.72.12.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 841DB40E80E0;
 Mon, 25 Jul 2022 13:32:07 +0000 (UTC)
Date: Mon, 25 Jul 2022 21:32:04 +0800
From: Baoquan He <bhe@redhat.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <Yt6bVIoRa0nIvxei@MiWiFi-R3L-srv>
References: <YtlyDZEsOZHt6tRs@MiWiFi-R3L-srv>
 <20220721015605.20651-1-slark_xiao@163.com>
 <2778505.1658746506@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <2778505.1658746506@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 07/25/22 at 11:55am, David Howells wrote:
> Baoquan He <bhe@redhat.com> wrote:
> 
> > sed -i "s/the the /the /g" `git grep -l "the the "`
> 
> You might want to clarify the first "the" with a preceding boundary marker.
> There are some English words ending in "the" that can be used as verbs, though
> I'm not sure you'd find any of them here - clothe for example.

Right. I plan to split this big one into patches corresponding to
different component as Jonathan suggested, and will consider how to mark
the first 'the' as you suggested, and wrap Slark's pathces which
includes typo fix of "then the".

Thanks
Baoquan
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

