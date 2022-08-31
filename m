Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD695A94D5
	for <lists+linux-cachefs@lfdr.de>; Thu,  1 Sep 2022 12:41:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662028897;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wgPDZ/L6vlSWFigpVLlyEMAcT/G/BS7IXOfH8qJKFj4=;
	b=J8JrCvc+R1ctvQCaeFVkpnYmmkCSLEt2OMNeoEYq3WyWNGYiXDzKM3sz79tvcD/A7JD2OS
	sHF0cG3eS6m+LAGoYKlIFKfFnXBF5OA+z+4lHeZRdUguPBde+9n7At6U+zE1vd0siSvuZq
	yx/1YNIba9ElXd1VCk26BnVah6ngP0o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-yrPjEcEQNgeHvbCB9ZVEXA-1; Thu, 01 Sep 2022 06:41:33 -0400
X-MC-Unique: yrPjEcEQNgeHvbCB9ZVEXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF00B811E81;
	Thu,  1 Sep 2022 10:41:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 13E4C40B40C7;
	Thu,  1 Sep 2022 10:41:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E6F7019426AB;
	Thu,  1 Sep 2022 10:41:31 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1BDCB1946A40 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 09:13:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EED902166B2A; Wed, 31 Aug 2022 09:13:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB0622166B26
 for <linux-cachefs@redhat.com>; Wed, 31 Aug 2022 09:13:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEE03803520
 for <linux-cachefs@redhat.com>; Wed, 31 Aug 2022 09:13:49 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-v9FKu8KrNYqoG-LtUd9TTw-1; Wed, 31 Aug 2022 05:13:43 -0400
X-MC-Unique: v9FKu8KrNYqoG-LtUd9TTw-1
Received: by mail-ua1-f53.google.com with SMTP id d14so5211786ual.9
 for <linux-cachefs@redhat.com>; Wed, 31 Aug 2022 02:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=9lQlWzwRA7mmLZ83Bk5j1stsiIHWI9p/Pq3FJcBwBuE=;
 b=jvWUoZtSzLOgdR/lc3QunpY6PusYGkI/dZ9/Ph9ITADlVJ7u7B1dlBVqoWY66wzvhe
 eMAzvifKO03nepxlyzYzpF1jXJEv1Si2+lKk1oqbZG3j3RCuWCbs6sheesr0tXzMaWr8
 3rCb/RBx2TS0El8o9ZEl7E/N/3+Ka4If540qY+XAqA1UMM4K4aq6t4o3niPQk/hEcctA
 WNvVStkzclMwxkAnky/wrev2tTCKCmS9U7PUGyQ6k8Z/5TREzaIS8A+z8NfQgDCe5D+d
 2eS3iPMNyUgPd+mxib8rixvGJfraqoAvdLM0q472BKWURl2FQNIObiUh7m6KAwmhPDE9
 U/kg==
X-Gm-Message-State: ACgBeo3CW5USmmqNWhD4ycEHPkdLW87HavadCvvvDiv9OafnW2EQkAcm
 MtaVm+5inKN7nVBYkUfgYlKr2G0HxIqA4l3K0qiniA==
X-Google-Smtp-Source: AA6agR6JxD3MIVnuuOhxXDtgKQr1RR3Y8OSBsF/SKvBmwmKpjpsVlJOMvAw1KoFQsHBRen/GMaC1ip/AA+5/0oi1XLA=
X-Received: by 2002:ab0:7214:0:b0:39f:2d13:2d5f with SMTP id
 u20-20020ab07214000000b0039f2d132d5fmr6624048uao.83.1661937222430; Wed, 31
 Aug 2022 02:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000d082f105e6f93705@google.com>
 <4020341.1661343794@warthog.procyon.org.uk>
In-Reply-To: <4020341.1661343794@warthog.procyon.org.uk>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 31 Aug 2022 11:13:31 +0200
Message-ID: <CANp29Y5AvokVpTWy9kEZofWfkoE8uUd+nJ2+pcKwndLQ2no3sg@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mailman-Approved-At: Thu, 01 Sep 2022 10:41:02 +0000
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
 'Aleksandr Nogikh' via syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Dongliang Mu <mudongliangabcd@gmail.com>,
 syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

You can either write #syz fix: <new commit title> and use the title of
one of the commits that removed/rewrote that code.
Or just "#syz invalid" (without quotas) if there were no fixing
commits and the ones that introduced that faulty code were just
dropped.

Best Regards,
Aleksandr

On Wed, Aug 24, 2022 at 2:23 PM David Howells <dhowells@redhat.com> wrote:
>
> syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com> wrote:
>
> > This bug is marked as fixed by commit:
> > fscache: fix GPF in fscache_free_cookie
>
> The code that was buggy got entirely removed and rewritten, so the fix is
> obsolete.  How do I communicate that to syzbot?
>
> David
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/4020341.1661343794%40warthog.procyon.org.uk.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

