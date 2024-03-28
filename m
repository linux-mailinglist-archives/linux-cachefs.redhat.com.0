Return-Path: <linux-cachefs+bncBDLIXLMFVAERBLVZS2YAMGQET6QBCMA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 7493D89056F
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:37:03 +0100 (CET)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-5a553729aa5sf1428267eaf.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:37:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643822; cv=pass;
        d=google.com; s=arc-20160816;
        b=l7OppadSEmDrtOO75VTtNKA7xs5wjVIUf3hq+lheJF7UhpFXOuCTZnhrRaQHVyUpVB
         jeXcujyUmP5OUkj13N+/v/QKVyLHAmsOTxNasABzb9AcciMxXKg4kNQcx6Zos5wj2f/o
         5AenBM709QOtfJnHY7lLhRaLh56101bxXX8mWpTFqssMsOnQHqwyg0kkdLicBY/iVuEa
         JW+SWrAucnb2z9BdXk5zEEwPsBNZW14XVz9tMslFHFddm1GmgQAFFOllAcKdYMxFrz3C
         ny/LsOy9qxGk7ydPpR3MtHIAG+5Y3RM/m2MlfSPD/cRozULmNRTIQBYJBMtFoZ7yZEEG
         5Q9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=/UZlLrTgTgv55H7j4ltVug1nWXFUuyF/YcEDurgf7fU=;
        fh=DfxaMNDeMdImhXBOqnfaUURHmhJ+0D3kvsSqyyTb6Ek=;
        b=yXifQWoFzHr2yj7082xBpl4vLV8dyeegQhDpZqAKFRwQ+dAIpfIykOaYfmKhe+fIbr
         JB4ZlTamwOmyblxwbeDQO0/BtAl4wOFbS4rGwGA5nRyAhC1/pgbB0GiJg4n8kJkf57HH
         0BkeiC/H1ssTdzg3nhz4HfhV/vPqTHfBIcRf99I2DD1gFq7hQNTkFsjkOIDuNuh5EH3L
         IcUoTqAyBE9tDwDR+fLx++KMM3pB3mcbJpc+8AEWRTZSj99MlhagyHf5rvrOFTmDjUYS
         m6Xanpq1xEOa9OwIaefvTmhluhpuuT2DaBpNLRNYMB9SNMUzOI2AhPWy6ewFk20pM8tp
         aeHw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643822; x=1712248622;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UZlLrTgTgv55H7j4ltVug1nWXFUuyF/YcEDurgf7fU=;
        b=h+u7k0/jp+d35zpPqJMOtfDYzAwG5+qAJ9FdR4xkjq3bIoV2JHJKhaPYzqfQtNyZR8
         HXI9DpJEeiG2Ly9xpbHXOEzv3OIYKCsgrHBb8mufT957g1qkX+LoDUuNzPnIPhYSXbHU
         eCYZHYMVHzBEd3cYl39STj+o5EqfNZoCZ3WRB4JLxyAXB0EFusEhf88oV2GHPxr3INzR
         U5L2PDo4w0ndy0ojbw1/hbhddfkqi0jQW/46UNgOGGUFYvuY7mJPSx5puK3QiKIvEL9i
         B1/uIsZ2wQACxKZSX/o77JTris1KsUEmT4lGtlAc/zIgRnxFobOmsKOIbMbmUv7f93+S
         kHhw==
X-Forwarded-Encrypted: i=2; AJvYcCVYivR555VPoWqKJrljT3F87aD50y2mvsACCweyLTlWpoElvz+NTdRX45bSDQ8np/MnOpdW7T99KIpG0cTCA0k9Bute0BqeIKmz3EA=
X-Gm-Message-State: AOJu0YwKlmgVqBjYvyQbk6k2rtdChG/hMA0za1bNKQKWFQmR9c7P2niO
	hAjgKXVrJANK/GGB02GSve8XOCmmUD2G14gC5IrU+lOoCUDQM74i/3g8euhDO/4=
X-Google-Smtp-Source: AGHT+IEYVMrDMzMNZhCN2BU/SxGenDTGPE0gaerH+SST8meVC0o12UTFetX5dCvYVoqXIHr9KM1WYA==
X-Received: by 2002:a05:6870:90ce:b0:222:8943:df2b with SMTP id s14-20020a05687090ce00b002228943df2bmr3438639oab.16.1711643822231;
        Thu, 28 Mar 2024 09:37:02 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6871:400e:b0:22a:9d9e:67c1 with SMTP id
 kx14-20020a056871400e00b0022a9d9e67c1ls401560oab.2.-pod-prod-09-us; Thu, 28
 Mar 2024 09:37:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWx2bVW6h+wjk7/+q4aqvhKOZkPT4e0Hh/iVWYn1++m5CZe2a+2z1Y4wPNi3xfHhfmxNHXM5+cDP9THLf1zGdRBmKESFKlko8B5n0EQU0g=
X-Received: by 2002:a05:6358:341d:b0:17f:5657:8d57 with SMTP id h29-20020a056358341d00b0017f56578d57mr3440170rwd.9.1711643821531;
        Thu, 28 Mar 2024 09:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643821; cv=none;
        d=google.com; s=arc-20160816;
        b=IHGAn+LHWHUiqhPJAT4S437TjU/m/5ZvO3XVznZYlhwHNqbCpxLTdOtW7IGgK9jmK9
         NVBazJOgLZuyzLk3BTRQ6ROjWSmmgPwksAwoyLWCXHMJRAiFcpJjncAVZccr4IedCYtX
         Ibuq5CX7q23moX2M4pfYKZl2Qg+H58MzFyF8/0uVmNalGslkvfJz4AeuCWKJjWtX5Awc
         Sn7+4RwRlqHq9Vr7Fql58N+k2M6j4dWZfedaU01YCa4384Nxut7eLH7BAhSTbKoUYQrr
         duygzSD9uShBY+nucm9TQUgmb+Y4lufclKAFNFXfimT3l8e4Uuj0++6XST/IzBzgm2aj
         RI5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=83auCTKPJvOhAjo7iO96K59ucStUj2OSCQeoe5vc/FY=;
        fh=MRByWdGD0e7LCOwxmXv5cYQpukVa0xHJcjZh5lBl/ic=;
        b=S6lllxYXslHfVyvvVfEYIiqJIm2vBK+1UUID7FA/LYegVsKoNzUbnep7MfVj8B5IR4
         2i6CXkBmLaqOiltHaL1SUPs7ncWgeaj/8ZStu2oTNQ/5kGBj0TeI5BSQ4YaXFqQhJm7a
         PeW1hu8nXe1MIk0ozqWP/Cdh7Jo1fgGmzj6Ar2TQrbzxn4f8kdK2iz5uy86/fCdeqbKw
         UizLXKWdTjBgUXth81lH1AZRuHpE/sNnvXyMpxldY3EMSZKlpldUZkurs92RxY/3mH6M
         NIWWM3MgOyd4H4GtkjBY2VGOwPIgPTQ0egjdr4AiwDSC07+/eJyj1gC5RXlVW+wbarPM
         g3Gg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id g10-20020a05620a108a00b0078a5167b1d6si1730982qkk.630.2024.03.28.09.37.01
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-20-6jxVEKdhNsKLiq3sz_3WIQ-1; Thu,
 28 Mar 2024 12:36:59 -0400
X-MC-Unique: 6jxVEKdhNsKLiq3sz_3WIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 434AA29AC039
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:36:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 3FE90C37A87; Thu, 28 Mar 2024 16:36:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E197CC37A83;
	Thu, 28 Mar 2024 16:36:55 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steve French <smfrench@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: [PATCH 11/26] 9p: Use alternative invalidation to using launder_folio
Date: Thu, 28 Mar 2024 16:34:03 +0000
Message-ID: <20240328163424.2781320-12-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Use writepages-based flushing invalidation instead of
invalidate_inode_pages2() and ->launder_folio().  This will allow
->launder_folio() to be removed eventually.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Eric Van Hensbergen <ericvh@kernel.org>
cc: Latchesar Ionkov <lucho@ionkov.net>
cc: Dominique Martinet <asmadeus@codewreck.org>
cc: Christian Schoenebeck <linux_oss@crudebyte.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: v9fs@lists.linux.dev
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 fs/9p/vfs_addr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 047855033d32..5a943c122d83 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -89,7 +89,6 @@ static int v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
 	bool writing = (rreq->origin == NETFS_READ_FOR_WRITE ||
 			rreq->origin == NETFS_WRITEBACK ||
 			rreq->origin == NETFS_WRITETHROUGH ||
-			rreq->origin == NETFS_LAUNDER_WRITE ||
 			rreq->origin == NETFS_UNBUFFERED_WRITE ||
 			rreq->origin == NETFS_DIO_WRITE);
 
@@ -141,7 +140,6 @@ const struct address_space_operations v9fs_addr_operations = {
 	.dirty_folio		= netfs_dirty_folio,
 	.release_folio		= netfs_release_folio,
 	.invalidate_folio	= netfs_invalidate_folio,
-	.launder_folio		= netfs_launder_folio,
 	.direct_IO		= noop_direct_IO,
 	.writepages		= netfs_writepages,
 };

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

