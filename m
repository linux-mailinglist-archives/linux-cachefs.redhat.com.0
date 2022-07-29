Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AC958493C
	for <lists+linux-cachefs@lfdr.de>; Fri, 29 Jul 2022 03:08:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659056917;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=24HhgWFuNhEkM0hZJR2q+on6581lwhM8JPsUrfyX8xQ=;
	b=f0B9W8ARIs44p11b8DF4WF9E6C14NyDfx0myfRBSUrEQSLOMnzmsYV2Bu7nu+Qe/eksj/X
	EjRsyIIAz0PZb48aATyBcxR/QXwj5W0kt6x6SnvWVe4fSemyCyPsBB44+dskDxaQR+jxIo
	s1lwmNyxzXfrA2YgpJEpF0nzVscsUTM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-bbJK_2y3Nri6X_dVjh1xkw-1; Thu, 28 Jul 2022 21:08:35 -0400
X-MC-Unique: bbJK_2y3Nri6X_dVjh1xkw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 407C58039B0;
	Fri, 29 Jul 2022 01:08:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C02CF492C3B;
	Fri, 29 Jul 2022 01:08:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 84EB51945DAE;
	Fri, 29 Jul 2022 01:08:33 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 553D71945DA7 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 29 Jul 2022 01:08:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3968A492CA2; Fri, 29 Jul 2022 01:08:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from localhost (ovpn-13-195.pek2.redhat.com [10.72.13.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13655492C3B;
 Fri, 29 Jul 2022 01:08:31 +0000 (UTC)
Date: Fri, 29 Jul 2022 09:08:26 +0800
From: Baoquan He <bhe@redhat.com>
To: Slark Xiao <slark_xiao@163.com>
Message-ID: <YuMzClsPIl47Ox5/@MiWiFi-R3L-srv>
References: <YtlyDZEsOZHt6tRs@MiWiFi-R3L-srv>
 <20220721015605.20651-1-slark_xiao@163.com>
 <2778505.1658746506@warthog.procyon.org.uk>
 <Yt6bVIoRa0nIvxei@MiWiFi-R3L-srv>
 <55d366e4.486.1823808de32.Coremail.slark_xiao@163.com>
MIME-Version: 1.0
In-Reply-To: <55d366e4.486.1823808de32.Coremail.slark_xiao@163.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
 bigeasy@linutronix.de, ast@kernel.org, song@kernel.org, sdf@google.com,
 will@kernel.org, daniel@iogearbox.net, corbet@lwn.net, william.gray@linaro.org,
 john.fastabend@gmail.com, andrii@kernel.org, mingo@redhat.com,
 longman@redhat.com, dyoung@redhat.com, vgoyal@redhat.com, boqun.feng@gmail.com,
 kpsingh@kernel.org, yhs@fb.com, tglx@linutronix.de, haoluo@google.com,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, jolsa@kernel.org,
 bpf@vger.kernel.org, martin.lau@linux.dev
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 07/26/22 at 09:04am, Slark Xiao wrote:
> At 2022-07-25 21:32:04, "Baoquan He" <bhe@redhat.com> wrote:
> >On 07/25/22 at 11:55am, David Howells wrote:
> >> Baoquan He <bhe@redhat.com> wrote:
> >> 
> >> > sed -i "s/the the /the /g" `git grep -l "the the "`
> >> 
> >> You might want to clarify the first "the" with a preceding boundary marker.
> >> There are some English words ending in "the" that can be used as verbs, though
> >> I'm not sure you'd find any of them here - clothe for example.
> >
> >Right. I plan to split this big one into patches corresponding to
> >different component as Jonathan suggested, and will consider how to mark
> >the first 'the' as you suggested, and wrap Slark's pathces which
> >includes typo fix of "then the".
> >
> >Thanks
> >Baoquan
> 
> Actually I have committed all changes which were listed in your previous list.
> I committed it one by one and checked if any other typo is included.
> If possible, you can try other double typo issue like "and and " or "or or" or something else.

That's good, I take leave this week to be babysitter, please go ahead to
handle all of them you found out.
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

