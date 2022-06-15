Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD0E552CAF
	for <lists+linux-cachefs@lfdr.de>; Tue, 21 Jun 2022 10:18:00 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-y8IiiFF5NtWzaVEot2NDRg-1; Tue, 21 Jun 2022 04:17:57 -0400
X-MC-Unique: y8IiiFF5NtWzaVEot2NDRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 808A885A580;
	Tue, 21 Jun 2022 08:17:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23B59C2811B;
	Tue, 21 Jun 2022 08:17:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A1173194704A;
	Tue, 21 Jun 2022 08:17:54 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9B2231947B84 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 15 Jun 2022 09:17:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 744F22166B2A; Wed, 15 Jun 2022 09:17:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FB4B2166B26
 for <linux-cachefs@redhat.com>; Wed, 15 Jun 2022 09:17:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5474A101AA45
 for <linux-cachefs@redhat.com>; Wed, 15 Jun 2022 09:17:19 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-gQhLilEbOLuaiIEFW5JbPQ-1; Wed, 15 Jun 2022 05:17:15 -0400
X-MC-Unique: gQhLilEbOLuaiIEFW5JbPQ-1
Received: by mail-io1-f72.google.com with SMTP id
 i126-20020a6bb884000000b006691e030971so5738494iof.15
 for <linux-cachefs@redhat.com>; Wed, 15 Jun 2022 02:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=0PqKA3BvckoxiB075Cj7gqwnZPd2LOo9Nia6wRFz23J0LroVbyLMsCOXS6XzBKcG5x
 efYWrOzRWdWblq7pCRdP15qQ9U8Box58GP524k6430j8xb9GjqnGyISLuHOTK9gRXxa+
 VeSu3TNhvNEWyUihGYpGf4kQItZ/KUybC5I/JcxWSGSV52SPtlpw30OL1+a1jNskIFxu
 sxs8D2DAXYOaoX4wzRhxaXrjUyzq4gQ0TcJW6d6P7kkGhWeWYlRySrQyspAmfwgDRohf
 2D2KCAnb7Un9dZlJO/2dEUu3uGaL8/zYBJnDo1R2hVWksSLRERO0Co6Lfokp7a5mN0kw
 OcCQ==
X-Gm-Message-State: AOAM531/2+ndelL20YOFdryxHoJ8HIImxcvwpSuUA9/VwEEZcCIG3Vw9
 kzCZmyAD5rwoDM6ulBexlZRruZ7dszfkNJwPdI5hNd9Ojnij
X-Google-Smtp-Source: ABdhPJxovQRz/hp/ytkhe13B3x5BwOLmalwzoxbSro+i1hOF1Xj9TTkUXxckE9He5j28lM3HzlW6ZqzdpqsF82VHdVWOems7/s1a
MIME-Version: 1.0
X-Received: by 2002:a05:6638:218b:b0:331:aec6:9bf9 with SMTP id
 s11-20020a056638218b00b00331aec69bf9mr5141953jaj.100.1655284634978; Wed, 15
 Jun 2022 02:17:14 -0700 (PDT)
Date: Wed, 15 Jun 2022 02:17:14 -0700
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ab916f05e178fcf8@google.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mailman-Approved-At: Tue, 21 Jun 2022 08:17:53 +0000
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

