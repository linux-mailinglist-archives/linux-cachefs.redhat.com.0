Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A156902C5
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Feb 2023 10:03:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675933405;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=if7rzX7GMjd/li93Q9GIipa1ol123tIAWlbkcNP39Ok=;
	b=U/RhwHlWVwB7frpC49V0fAUrZgJ/VvsWiYDirXNjb553tWZTjFQzJTFvG2hBpLQaKlRbhP
	DkOhe1iMSm+sRQPmW+FAk0oopfbCm5Q/uqbe2UzYXDbnIiGFMs3sRGDDNwlXy2CqTUOOAM
	jHQ3UNslkq4RTu0yWpzXIc5HNEZFjIg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-QWXP-x6nPwmz4bUkYwXLkg-1; Thu, 09 Feb 2023 04:03:21 -0500
X-MC-Unique: QWXP-x6nPwmz4bUkYwXLkg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93A893C01DED;
	Thu,  9 Feb 2023 09:03:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3252492B00;
	Thu,  9 Feb 2023 09:03:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 60C591946595;
	Thu,  9 Feb 2023 09:03:19 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E21521946589 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  9 Feb 2023 09:03:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C1C134043855; Thu,  9 Feb 2023 09:03:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA22C4043840
 for <linux-cachefs@redhat.com>; Thu,  9 Feb 2023 09:03:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 981551C0512B
 for <linux-cachefs@redhat.com>; Thu,  9 Feb 2023 09:03:17 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-REkvaVnHNjWLlMkZeXj2WQ-1; Thu, 09 Feb 2023 04:03:15 -0500
X-MC-Unique: REkvaVnHNjWLlMkZeXj2WQ-1
Received: by mail-lj1-f172.google.com with SMTP id b13so1273704ljf.8
 for <linux-cachefs@redhat.com>; Thu, 09 Feb 2023 01:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Rw0L6Va6diQDvp094MQJTGkE+0LV3C/TK0OJjT1s08=;
 b=SMcKkUCYH62OdYdI838w52PmqvTVoLOQLGpNbPTly5PKMK5f+SGo1Zh4dQNYemNpyl
 9pYktg1lwo79tUMflBVgmweNEYQOu+n3+iCigRQFRAdycRCo29whpqlxjDtTqsZf+aES
 H9WRsAPgXhHrEiDNaZ8fj8yQvFM8YlnwVHejUdMF8dX7NvPt8JLevE0qOoyuf1hk0GNp
 byi3Sy/oot2W01u4zbaJ66EeE+OHaaQvdyPyWXRFi6gCu5bPYzAtm/dZYwxbt5McUaPZ
 cBAk/Zncw05TjOsv/RREOcEEmk7eluUr1LSoaurEeFnQw+yp01RxWGXkaWHZhVxh0zm1
 h22Q==
X-Gm-Message-State: AO0yUKXmLLsp/ASC5AmpdzXikJSb9+lO3RevPmw21DI4jAwyXG3GzeVc
 rYmMx8ebhtwFYb/yz6RISUiV/FaQiej4+hANBhrDdA==
X-Google-Smtp-Source: AK7set+ZS2F4AKPqgewxK5a53tJil2dGzck8CgFQydNgnyawPi6bcGrUs+oMs1Wk/CvLV7mm9XG6qir+uMAqWgngs28=
X-Received: by 2002:a2e:91cb:0:b0:293:30ed:25d1 with SMTP id
 u11-20020a2e91cb000000b0029330ed25d1mr216508ljg.15.1675933393549; Thu, 09 Feb
 2023 01:03:13 -0800 (PST)
MIME-Version: 1.0
References: <000000000000f2b07b05d5dc87cc@google.com>
 <0000000000003deeef05f43f8d47@google.com>
In-Reply-To: <0000000000003deeef05f43f8d47@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 9 Feb 2023 10:03:00 +0100
Message-ID: <CACT4Y+YPy1Cf2hDHBXuGjX8QAnESEEN+iGHgeZ8mQiueY5JQ9Q@mail.gmail.com>
To: syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
 mudongliangabcd@gmail.com, nogikh@google.com, linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 9 Feb 2023 at 08:44, syzbot
<syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com> wrote:
>
> This bug is marked as fixed by commit:
> fscache: fix GPF in fscache_free_cookie
>
> But I can't find it in the tested trees[1] for more than 90 days.
> Is it a correct commit? Please update it by replying:
>
> #syz fix: exact-commit-title

Let's remove this fixing commit, it apparently does not exist.

#syz unfix



> Until then the bug is still considered open and new crashes with
> the same signature are ignored.
>
> Kernel: Linux
> Dashboard link: https://syzkaller.appspot.com/bug?extid=5b129e8586277719bab3
>
> ---
> [1] I expect the commit to be present in:
>
> 1. for-kernelci branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
>
> 2. master branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
>
> 3. master branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git
>
> 4. master branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
>
> The full list of 10 trees can be found at
> https://syzkaller.appspot.com/upstream/repos

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

