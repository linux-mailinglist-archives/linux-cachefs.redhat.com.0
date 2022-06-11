Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D194E5473E8
	for <lists+linux-cachefs@lfdr.de>; Sat, 11 Jun 2022 12:45:16 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-mzGjD1ZdPf2SoKyTdgbuMg-1; Sat, 11 Jun 2022 06:45:13 -0400
X-MC-Unique: mzGjD1ZdPf2SoKyTdgbuMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 462F729AB403;
	Sat, 11 Jun 2022 10:45:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18A4D18EA7;
	Sat, 11 Jun 2022 10:45:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CFF04194705A;
	Sat, 11 Jun 2022 10:45:10 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CC1E51947054 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 11 Jun 2022 10:45:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BE4BF492CA4; Sat, 11 Jun 2022 10:45:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA0F7492C3B
 for <linux-cachefs@redhat.com>; Sat, 11 Jun 2022 10:45:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A22CC800124
 for <linux-cachefs@redhat.com>; Sat, 11 Jun 2022 10:45:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-hYPq7b8LOPO5i3x50I4GrQ-1; Sat, 11 Jun 2022 06:45:07 -0400
X-MC-Unique: hYPq7b8LOPO5i3x50I4GrQ-1
Received: by mail-wm1-f47.google.com with SMTP id
 r187-20020a1c44c4000000b0039c76434147so2254123wma.1; 
 Sat, 11 Jun 2022 03:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=a9ATP95JSYITDvtcZYgILfU969WEQUwCi9QMxQISlfw=;
 b=hXqKw8CCTw3vkF/uykzhXDfES3nJEbG5WqesszcNx4pdEMFB3UgPB4qwcYdRyEGIs2
 cF68zFcoDMN6IdVKG9L0pOrvyuBRD+Qf2zrSbEf6hWADSRXrHfRgY6mffl8XQVxvd9R/
 LCeU9999D0oONXv+wCtE/m7OflASzCmZAtcTTM3UWhkjuwsT+w5sN4NxUnUsUCx/NH+J
 9KACh/cEF8CGoY3Wo0IfOVYv7oIsTY2i7O6R/eBFStvFwOkPMlcQxk/c2y0Y7H9gJuFc
 Q9R6iIY8thB+70Y6xND9TrD1/7BD891rA7Moj4m89PbyzLvbbTnsV+Jp7JN3NIgQPW2T
 PvUA==
X-Gm-Message-State: AOAM533W1jqqTEIdpPfF0RacigIC54RZikaHZTIi7xIZmkiE03+gHqwy
 eSr4uW+b+9Kjkl+6Krg4y6aRCareOos=
X-Google-Smtp-Source: ABdhPJxjfvo6XrtQ+Hcu7hnFyGXxQzXmb+60Sxx8moqSaXPRMMOx26YUKe+ROCWhkMhCSBz3y1N/cg==
X-Received: by 2002:a05:600c:4e8e:b0:39c:80ed:68ad with SMTP id
 f14-20020a05600c4e8e00b0039c80ed68admr4069701wmq.63.1654944305505; 
 Sat, 11 Jun 2022 03:45:05 -0700 (PDT)
Received: from debian (host-78-150-47-22.as13285.net. [78.150.47.22])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c22c600b00397122e63b6sm2006978wmg.29.2022.06.11.03.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 03:45:05 -0700 (PDT)
Date: Sat, 11 Jun 2022 11:45:03 +0100
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: David Howells <dhowells@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <YqRyL2sIqQNDfky2@debian>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Linux-cachefs] mainline build failure due to 6c77676645ad
 ("iov_iter: Fix iter_xarray_get_pages{, _alloc}()")
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, Gao Xiang <xiang@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-afs@lists.infradead.org,
 devel@lists.orangefs.org, Mike Marshall <hubcap@omnibond.com>
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

Hi All,

The latest mainline kernel branch fails to build for "arm allmodconfig",
"xtensa allmodconfig" and "csky allmodconfig" with the error:

In file included from ./include/linux/kernel.h:26,
                 from ./include/linux/crypto.h:16,
                 from ./include/crypto/hash.h:11,
                 from lib/iov_iter.c:2:
lib/iov_iter.c: In function 'iter_xarray_get_pages':
./include/linux/minmax.h:20:35: error: comparison of distinct pointer types lacks a cast [-Werror]
   20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
      |                                   ^~
./include/linux/minmax.h:26:18: note: in expansion of macro '__typecheck'
   26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
      |                  ^~~~~~~~~~~
./include/linux/minmax.h:36:31: note: in expansion of macro '__safe_cmp'
   36 |         __builtin_choose_expr(__safe_cmp(x, y), \
      |                               ^~~~~~~~~~
./include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
   45 | #define min(x, y)       __careful_cmp(x, y, <)
      |                         ^~~~~~~~~~~~~
lib/iov_iter.c:1464:16: note: in expansion of macro 'min'
 1464 |         return min(nr * PAGE_SIZE - offset, maxsize);
      |                ^~~
lib/iov_iter.c: In function 'iter_xarray_get_pages_alloc':
./include/linux/minmax.h:20:35: error: comparison of distinct pointer types lacks a cast [-Werror]
   20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
      |                                   ^~
./include/linux/minmax.h:26:18: note: in expansion of macro '__typecheck'
   26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
      |                  ^~~~~~~~~~~
./include/linux/minmax.h:36:31: note: in expansion of macro '__safe_cmp'
   36 |         __builtin_choose_expr(__safe_cmp(x, y), \
      |                               ^~~~~~~~~~
./include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
   45 | #define min(x, y)       __careful_cmp(x, y, <)
      |                         ^~~~~~~~~~~~~
lib/iov_iter.c:1628:16: note: in expansion of macro 'min'
 1628 |         return min(nr * PAGE_SIZE - offset, maxsize);


git bisect pointed to 6c77676645ad ("iov_iter: Fix iter_xarray_get_pages{,_alloc}()")

And, reverting it on top of mainline branch has fixed the build failure.

--
Regards
Sudip

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

