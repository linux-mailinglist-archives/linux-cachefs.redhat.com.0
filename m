Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D81B85F61C1
	for <lists+linux-cachefs@lfdr.de>; Thu,  6 Oct 2022 09:37:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665041870;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cKGO4z9xBzGQGTDnhurlIDIsZYw6ZRF9HEAgYThtAgg=;
	b=OkwxJXDYigCQnQzrdgiobHEi1ltIl/S/486rzs17HyjYmPc7qI0ZL6+5lQ0Chs0TQ0gSa3
	7H2yZiIff+5ns4CwhS0+9DeDeRc5DdoGRIo8K02DKH4w+yHasyZ/9l2FLxM3RrE57NBiTq
	1hnPAh+wHPzmfItXpW30R/NgjUsqPcY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-aXLJWkXfMdWSbQ-xUQLiSg-1; Thu, 06 Oct 2022 03:35:48 -0400
X-MC-Unique: aXLJWkXfMdWSbQ-xUQLiSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F95586EB20;
	Thu,  6 Oct 2022 07:35:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCCE440C94EC;
	Thu,  6 Oct 2022 07:35:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 85BF11946A72;
	Thu,  6 Oct 2022 07:35:44 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1FBA31946A4E for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  6 Oct 2022 07:35:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E5C65200E28D; Thu,  6 Oct 2022 07:35:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCE64200E288
 for <linux-cachefs@redhat.com>; Thu,  6 Oct 2022 07:35:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC9EC3804507
 for <linux-cachefs@redhat.com>; Thu,  6 Oct 2022 07:35:42 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-q9p7-e-pMdyxxziZ6hYc3A-1; Thu, 06 Oct 2022 03:35:32 -0400
X-MC-Unique: q9p7-e-pMdyxxziZ6hYc3A-1
Received: by mail-lj1-f177.google.com with SMTP id x40so1222944ljq.9
 for <linux-cachefs@redhat.com>; Thu, 06 Oct 2022 00:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BUgO7Gn6HVGXmIvVSi76EssaR+MnNtPNxr+txyIXJQI=;
 b=Xpwu+zaWhzyQI4gnledtxfjkY5uibYzfDWv/eGcD1RGG4u7V2LyyGHnjBomQJ4xOhE
 zFuu3BHgjTMVAr6fjJHmVoIdlmku3zCaGDz7nL3p9iGiIpD1/80oCj+LK/UT+vzOyRWP
 /t+u6/vSpyAKhfNm67wWrqd6m5Mie2zK9RMf0msYYzyoF3KYd/i49pFVdPAK8BIZCaa6
 LPmeme30ZbrrLlOmNxpFKUPlh8jnsfnWCu8oBKkrZikDbMjR8+IIM4gMxm+ficx9nl+4
 0hYuBfNCwO5P589d9QGJrvovFVrbLDFYyahNmVxb0w0BHCtitm1j/w4Ah7djqe2kkinR
 fRWA==
X-Gm-Message-State: ACrzQf1QBL6lCIUPYHGculIhvYSo0xqlFRDq4FYbWVwBFGLTphd2Xmb7
 o9GTJQyvWn2A97YcdDAb+uF/ODxT4tMDGjS6KWQgQrpUygYO6w==
X-Google-Smtp-Source: AMsMyM4hW2xJKBoRlc2CjuPTMUiKPvR3WrNG+dw1Puc4847yKNeOsQ4MiYWzDDCtoRb1aZSdVlc5KSjaHClf3nk+AJk=
X-Received: by 2002:a2e:b0e6:0:b0:26e:4dd:16f5 with SMTP id
 h6-20020a2eb0e6000000b0026e04dd16f5mr157970ljl.268.1665041731050; Thu, 06 Oct
 2022 00:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000f2b07b05d5dc87cc@google.com>
 <00000000000093aefb05e9b93343@google.com>
 <CAD-N9QWpDpP5YGwq363Z1jDOeEK+S1JjNGmiZsD4KimZSkowgw@mail.gmail.com>
In-Reply-To: <CAD-N9QWpDpP5YGwq363Z1jDOeEK+S1JjNGmiZsD4KimZSkowgw@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 6 Oct 2022 09:35:19 +0200
Message-ID: <CACT4Y+ZYSO4u2VteN0C83AnyFyvD2afL7wyk2K_Ps9hhLtq38w@mail.gmail.com>
To: Dongliang Mu <mudongliangabcd@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Linux-cachefs] [syzbot] general protection fault in
 fscache_free_cookie
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
Cc: linux-cachefs-owner@redhat.com, linux-cachefs-bounces@redhat.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>,
 nogikh@google.com, linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 28 Sept 2022 at 11:23, Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>
> On Wed, Sep 28, 2022 at 5:15 PM syzbot
> <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com> wrote:
> >
> > This bug is marked as fixed by commit:
> > fscache: fix GPF in fscache_free_cookie
> > But I can't find it in any tested tree for more than 90 days.
> > Is it a correct commit? Please update it by replying:
> > #syz fix: exact-commit-title
> > Until then the bug is still considered open and
> > new crashes with the same signature are ignored.
>
> @Dmitry Vyukov Why syzbot continuously complains about this bug
> report? The fix commit looks correct.


git log --grep "fscache: fix GPF in fscache_free_cookie"
on the latest upstream tree gives me nothing.

Where is this commit present? What's the git tree and commit hash?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

