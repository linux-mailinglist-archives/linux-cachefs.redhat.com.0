Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E136F54215B
	for <lists+linux-cachefs@lfdr.de>; Wed,  8 Jun 2022 07:51:55 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-jf4qjMQ9P9GiD9pjwk_e9Q-1; Wed, 08 Jun 2022 01:51:52 -0400
X-MC-Unique: jf4qjMQ9P9GiD9pjwk_e9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 634FD811E7A;
	Wed,  8 Jun 2022 05:51:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E942140EC000;
	Wed,  8 Jun 2022 05:51:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7CAA61947042;
	Wed,  8 Jun 2022 05:51:49 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 96D20194706E for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  1 Jun 2022 09:16:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 887C840E80E1; Wed,  1 Jun 2022 09:16:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8483140E80E0
 for <linux-cachefs@redhat.com>; Wed,  1 Jun 2022 09:16:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CC50185A7BA
 for <linux-cachefs@redhat.com>; Wed,  1 Jun 2022 09:16:26 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-RXjY0SMVPFOm8af_YDHqXQ-1; Wed, 01 Jun 2022 05:16:24 -0400
X-MC-Unique: RXjY0SMVPFOm8af_YDHqXQ-1
Received: by mail-io1-f72.google.com with SMTP id
 x13-20020a0566022c4d00b0065491fa5614so575497iov.9
 for <linux-cachefs@redhat.com>; Wed, 01 Jun 2022 02:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=gOhwhGWUlurJzDQoFYVyXEe0wPqoO08jKakDb4JL+LUeI/GsxUCbaXFUQ/xgoRmN4o
 RlOB8ypP/qaGStC9/Pr3shIM2BWdWCY4+gNaFCMCJxkY+1myYlKFPTCJVQAPMjPHFYPl
 jPmtBWTFobxjNlOY/vglpW1IPTn0IEb2HY/V1h5/BnhIgSmI3YRZwdvEdSsOFpIVDdMx
 zYFJs2plQPl9llNQvnel6YJQl3TM0uvvZEq40a8C4M9nY4//UqYCQrsNI1Iwg/zqRGUK
 yPJtWs49bFD7RadPv6UpMuIGnnmUOrCAPMdlDkrXICiyPr9N7Kv9fh/StNHflcyxQ9Ff
 hKAQ==
X-Gm-Message-State: AOAM533l9ofitCgFBSqBYjES0rND5KXZj6osH2x8hIPoHFtMstosu3do
 F8IbI7XHAhbTBb1BgzayBGjvwLpLrkY1ekAKXmmoO+uffuYj
X-Google-Smtp-Source: ABdhPJx1LL8AZ73Jqh9VOj9UlGKgQV+jKWbLhyOzcUBGZ0Dtl7G1jyvg+xSnTxpPRL3nAHlkmb8e7vAr7Vj2Yew8Js/X4rb1woHc
MIME-Version: 1.0
X-Received: by 2002:a02:2124:0:b0:32d:beca:e5ab with SMTP id
 e36-20020a022124000000b0032dbecae5abmr33364107jaa.119.1654074982798; Wed, 01
 Jun 2022 02:16:22 -0700 (PDT)
Date: Wed, 01 Jun 2022 02:16:22 -0700
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c81ea805e05f571c@google.com>
From: syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-cachefs-bounces@redhat.com, 
 linux-cachefs-owner@redhat.com, linux-cachefs@redhat.com, 
 linux-kernel@vger.kernel.org, mudongliangabcd@gmail.com, 
 syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Wed, 08 Jun 2022 05:51:48 +0000
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
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This bug is marked as fixed by commit:
fscache: fix GPF in fscache_free_cookie
But I can't find it in any tested tree for more than 90 days.
Is it a correct commit? Please update it by replying:
#syz fix: exact-commit-title
Until then the bug is still considered open and
new crashes with the same signature are ignored.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

