Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0F062EE93
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Nov 2022 08:43:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668757382;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=I2oTyYwsMv94bCORMi9spBwr/mnigzuMZqvUHECG9Qc=;
	b=Wn80ma0nbBLWK8xtSeJVlLMzuxU1aFGSoaOuNo65EI13hDhgcdkf8Qgs/tSYTvTzdRMKDn
	vKauwK8A+XeCcL4hwpaNtim1WI+M0u3HXl67jfoChiLp3UQkxNMTLifg5dQaXD6OWk+IGZ
	hponRc/QVXuAD/XvFpFyQh2SoCfDi0Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-D1uwyRNaMzC6_G4GmTmQUw-1; Fri, 18 Nov 2022 02:42:59 -0500
X-MC-Unique: D1uwyRNaMzC6_G4GmTmQUw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD93E185A7A8;
	Fri, 18 Nov 2022 07:42:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C36614EA59;
	Fri, 18 Nov 2022 07:42:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2C68E1946A41;
	Fri, 18 Nov 2022 07:42:58 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D897A19465A2 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 07:38:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8D6A040C83DC; Thu, 17 Nov 2022 07:38:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8556640C83AA
 for <linux-cachefs@redhat.com>; Thu, 17 Nov 2022 07:38:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6902729ABA24
 for <linux-cachefs@redhat.com>; Thu, 17 Nov 2022 07:38:51 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-exxpzEJkO9SbjEDux19nXw-1; Thu, 17 Nov 2022 02:38:25 -0500
X-MC-Unique: exxpzEJkO9SbjEDux19nXw-1
Received: by mail-io1-f69.google.com with SMTP id
 x21-20020a5d9455000000b006bc1172e639so532948ior.18
 for <linux-cachefs@redhat.com>; Wed, 16 Nov 2022 23:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=RDzn4bZOqvXEIUGDkq5vDRNkHryYEZ7dtlv74dU49cqKdj91IHQSuGv2ahB/jXH5MI
 gZ1Kcr6XTGWnKGOxcNU6g9vNYw32LIRtjZjIsHHbS+Ej1uW14UEgUbFeEF6usIEy+Zlm
 kEnfy5O4ktQeYgXgNfoMGZq7IXRBjo7wn639Q/fgHqHL396MV0CX5IdipB1DbF/X3zhO
 E9AZhVIXyDGb8umAjTq8GR6G2H4aNDnhvBUrIrewEEOmGf/sOwv/9TPcqtLgmYt1ZvTF
 ctW4BFKIBhtJlvekfCjyrYl9X/O86zeuspZCsKC08fwZ8sxzQZSY/P9aQnXwfCr3tusm
 KySA==
X-Gm-Message-State: ANoB5pm3q4Wt+CYTDe9fOPksWfBvFhTk7j/23r/zFrAxpZJ8O/UJHcSd
 ZQOHsuAGLFnGwRvdtVvYxc8dQcY3k94PCgXPg2FsFgMnu4+D
X-Google-Smtp-Source: AA0mqf6KcZ7V5KSlcCipv6hNa7VXJbrwjKNrfSYMmThk4YG0+KXiIgRXF3ox37o1GKkbV07cWLnNqqMkkhOTwt0qKjuxFhTESGuS
MIME-Version: 1.0
X-Received: by 2002:a02:190a:0:b0:376:1ab0:7bd5 with SMTP id
 b10-20020a02190a000000b003761ab07bd5mr565688jab.8.1668670705193; Wed, 16 Nov
 2022 23:38:25 -0800 (PST)
Date: Wed, 16 Nov 2022 23:38:25 -0800
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a15e4a05eda5ac1f@google.com>
From: syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>
To: dhowells@redhat.com, dvyukov@google.com, linux-cachefs-bounces@redhat.com, 
 linux-cachefs-owner@redhat.com, linux-cachefs@redhat.com, 
 linux-kernel@vger.kernel.org, mudongliangabcd@gmail.com, nogikh@google.com, 
 syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Fri, 18 Nov 2022 07:42:56 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

