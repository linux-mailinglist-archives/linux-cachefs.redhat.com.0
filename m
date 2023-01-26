Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7113A6812B1
	for <lists+linux-cachefs@lfdr.de>; Mon, 30 Jan 2023 15:24:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675088642;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=fbaXIeGLwd4xdAeYuR4t8HbhS035csL97vKS5lUFlIg=;
	b=I0HDwIPDFuwKN/XLyFkE7qtXjyUwTO+eIYCowK/PNzMu+qOBKLrWMDv0O3RonJrfKK9LMc
	gzhdr8Jky06vVg+5PxEgWMegm1708tdF2UbacNnL3QkvTKjz6+OsawDPJtrRHDIlWp83ru
	oACCzhuBYhvCZyKhl0L7WWbOjGO8HGY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-YGL81scfOyOY6oCZpkVQUQ-1; Mon, 30 Jan 2023 09:23:59 -0500
X-MC-Unique: YGL81scfOyOY6oCZpkVQUQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9484F3C0E45E;
	Mon, 30 Jan 2023 14:23:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0874C15BAD;
	Mon, 30 Jan 2023 14:23:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 568181946594;
	Mon, 30 Jan 2023 14:23:57 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A70DB194658C for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 26 Jan 2023 07:43:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 94DC2492C18; Thu, 26 Jan 2023 07:43:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BA86492C14
 for <linux-cachefs@redhat.com>; Thu, 26 Jan 2023 07:43:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F66F85D064
 for <linux-cachefs@redhat.com>; Thu, 26 Jan 2023 07:43:29 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-520-mI_jKoKSM1izKqErCmGtAw-1; Thu, 26 Jan 2023 02:43:27 -0500
X-MC-Unique: mI_jKoKSM1izKqErCmGtAw-1
Received: by mail-io1-f69.google.com with SMTP id
 h17-20020a5d9e11000000b007049a892316so506696ioh.7
 for <linux-cachefs@redhat.com>; Wed, 25 Jan 2023 23:43:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7TQjimL8KUZMscO4m3fC34iqwHwmpZuK4STzqhRFKQI=;
 b=61GgJ4zzXrpb4EIwcKk1T3R6ajegaZyQw3dAHXaXZq7JjT4YlaPGfCT9ke0QLuV10t
 utInqdbj5alGnFcRCpxwh0+y7XaxdT2kiLRI6XlgJ/W3S6MvsO2simiO+1QyKwyG+IWS
 TK4mlWvMaj8sbnQsWHHgsfL3gCGaHLjXrcoA/imRd01oaCb6WI0XApfdComX8nuBZXe2
 SXynrKfSaeR2fZto1dw8kvq9RbHog3Dgx1Ml3s4IhqajcYBEUETfqN9FZ2WvzEmSWGhp
 NE/nhWW/Ml82rdjy6WI5mcWc5puG3Y3p3j/Czy+3wWkdCZk8WqT94w9nQaugHCLnD+SB
 6Rrg==
X-Gm-Message-State: AO0yUKXWLdzqPcCdZX0JNGrNcuyqV6TKK5SJUHc5AEM2omKIkcIglkd3
 QT8i9zPNLRkttQ7njQVLNApvGJgrzfvm1iffTT+EPObKaAtK
X-Google-Smtp-Source: AK7set/Vv6ZjO9ahlx0QhgfopXjJRbCub29Q4TxRW0teLnducMO6s47KRgREX7WE/K6uWQ9HZE4kOIcDUx6WGFFyypmZsXUQ6v8e
MIME-Version: 1.0
X-Received: by 2002:a92:8e05:0:b0:310:b8e9:dfd4 with SMTP id
 c5-20020a928e05000000b00310b8e9dfd4mr103349ild.69.1674719006911; Wed, 25 Jan
 2023 23:43:26 -0800 (PST)
Date: Wed, 25 Jan 2023 23:43:26 -0800
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000081766205f325e781@google.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Mon, 30 Jan 2023 14:23:55 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This bug is marked as fixed by commit:
fscache: fix GPF in fscache_free_cookie

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=5b129e8586277719bab3

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 10 trees can be found at
https://syzkaller.appspot.com/upstream/repos

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

