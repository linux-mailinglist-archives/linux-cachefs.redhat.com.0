Return-Path: <linux-cachefs+bncBDLIXLMFVAERBMPYRKWAMGQEBUWRTUI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2F0819C04
	for <lists+linux-cachefs@lfdr.de>; Wed, 20 Dec 2023 11:04:34 +0100 (CET)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-780fefc0912sf42325985a.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 20 Dec 2023 02:04:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703066673; cv=pass;
        d=google.com; s=arc-20160816;
        b=kDc/5p8/dPAyZc7TnKqbQPB2qlnI5tWYI6ifEcquxlewVnhEnixQeRa9yaGs1ivYik
         rgilTQSipA2+D91+eYk9fuqv1dGvt8uuXGcBgYVhsuvnnh1abTXfjMyawHi38pJ7sPdR
         TtuOUVdWsP/lN1lXBIPQJ5PkzDgcvI3p7dE6MESHl8egWucjNAqcCKW6yffIDIvj27lb
         7y2fEZwz0Koruw2VHsOS6IyYulA2P3i4prkWlvzdAXoj0U4d6ZFulwdrCQMXm7yNVJHM
         Vh1HEzuwy+x3uYhhgiddDAXV6pp3Cviy3mjoEYJndDQ8dOxcKJB0092eYYD/OWBOlPn4
         ntrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=dKk2DAlcgTVRWBXi4lo+1I1jmkkqvIe3Axy3fl+ixyI=;
        fh=OHBb9iCgy9UozJujGliSmQwHaxwEcgiKWa9S2zC2QS8=;
        b=uYThX0WeDfMZvcl+lLjT7Mc9TWT6A/6QsR0uKZt+KKdr3yF/kXsD/VSU46ISHqooxJ
         JwBM9f6fuIhD4KoX8eqE977Cg2m/i8jQxC8tZIkkjbVmCR08CexsZBGK/zwXzypoxoi/
         Kvo2HOC/89yno3qmj4VK7LeIHmbgy5Y7b8Tbxv/V+8oTbmIxfNh8/e2l3DK7DC2HO8tD
         zWARBpH31aIXyY7ax5HDeBrNh1lvQGm3+4AdcEPcNMvd3XeF/oTgtnjm+n9kap2VCsjt
         pkSH3jWRi2U+0hnhJ2JmZjTrFwOXemcNc5ZrCPdbN98bFm4lxw9bJ4ICyHZddjEtwzpy
         Wyzw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703066673; x=1703671473;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dKk2DAlcgTVRWBXi4lo+1I1jmkkqvIe3Axy3fl+ixyI=;
        b=TlV1u9/C1vFW3cMO2gIYFSBjhfx9+PLDtKn8LEI88DTD28Q+kJqnscgx0bJuWCwX6m
         hanazPZgjQ93Gk+wna1VWApA5G19RAt2eryhjHElr8rypd8w7C7wZLRPZ2zM95I/Zn7I
         SGz2O5mlUl6Xco33n8gf46vJ0QxE/IKW8f8fBpGzRHnLvAStIBgGBHvsjBhf1qptG6UL
         DgDskDzIVl6FPC7KMtVUWy7s3LChe0tPyZApvuqiK4g89mxptoH1IwlMuk3+659qIGF3
         Tks5l8vxyUmJSG0jz6+AeT+SDesXxLAx2tToJYezxFrpCvWKnmZcoDL7Qe92pk+KGCGG
         ETuA==
X-Gm-Message-State: AOJu0Yw2DIkwIe/gSRXo4TNRFsVoxE3rmnvwlR5CYpVYx1Qqijc9TBge
	hQMQsDVoqmNfBNreRctDQ/JNKA==
X-Google-Smtp-Source: AGHT+IHjf3QQHSzFoT5iS1HmpFdt72740W1q2gakresFA1Rav4J/r0hkm2XBB9YG1LilTZMvE7++Cw==
X-Received: by 2002:ac8:574f:0:b0:425:b5db:ee0 with SMTP id 15-20020ac8574f000000b00425b5db0ee0mr40957389qtx.3.1703066673176;
        Wed, 20 Dec 2023 02:04:33 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1996:b0:425:7ea5:45f0 with SMTP id
 u22-20020a05622a199600b004257ea545f0ls579504qtc.2.-pod-prod-04-us; Wed, 20
 Dec 2023 02:04:32 -0800 (PST)
X-Received: by 2002:ac8:5a43:0:b0:425:a4a5:a797 with SMTP id o3-20020ac85a43000000b00425a4a5a797mr25127624qta.109.1703066672442;
        Wed, 20 Dec 2023 02:04:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703066672; cv=none;
        d=google.com; s=arc-20160816;
        b=z6XwibpsoIVz1AvtPIL2YDDgRTk79s8EKDGbzdoCRAr3sKFx0lZ8P9E3PltlTtdFgI
         rJEaUpjzD1ax1qAQYQY8Tyx9v52rH0wVRfhnHCKXl/zP9GNv4kLskVBkfuUNkxadGm6S
         PX2hdQ85VPYZLM61sbYKVe1EzJschstWvXkqMlbyeD3UrvHWat892oDNsxxsHSJrjoBc
         9Eo1CzGVhbX8cHRODZmf2OuA4eUfjzSj46cVkxjZrPd0/U98tAsYcxdI7qrPr7iTFZKY
         13DjdOnuPo3iLL3MupNk0wqnrXXdbc/fL+khnvzrjQ5moJA9IB5Tol5Z6GQEHOOGIe+C
         NtTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=PdyNCO1BdqUsX6LenhPnm/I1uomWw265tftHOSOmEt4=;
        fh=OHBb9iCgy9UozJujGliSmQwHaxwEcgiKWa9S2zC2QS8=;
        b=zo8IJtnJ6LUaJNnDZjNFDMPehmV5lt+y54L3GO2u0qzdAdCl69DmCt67lDfqcefNBB
         UZYYSGF7fogWFd65ghpaOu/rsqDEIYfctDkelGyAcAez/K4+pU22rPJcyiZlgQOIMetE
         KeQPiOwaY1QkDjHQeDiIIuvMpuvrZLLC0B3IsGzmJ/MmhZUor4TbrWS4De2BRJy8igKM
         5pwharyhVUsVp4Fo3bdMaZnH+xT2hstTThQuATuylG5O8O8neFtVsdy+guB4fLdoVg5H
         qavJxTCluyPRnhVW6QOEuiDiZL5QF93f+C8QfwyyVZzB+xWZuRQr3yWiNena+JbaHgi+
         11wA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id cp10-20020a05622a420a00b00425433fec1csi27381313qtb.483.2023.12.20.02.04.32
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 02:04:32 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-359-gP7Tj-cLMrmf_emvrJ1MPw-1; Wed,
 20 Dec 2023 05:04:30 -0500
X-MC-Unique: gP7Tj-cLMrmf_emvrJ1MPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B1631C0513B
	for <linux-cachefs@gapps.redhat.com>; Wed, 20 Dec 2023 10:04:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 8844C51E3; Wed, 20 Dec 2023 10:04:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8BFAB51D5;
	Wed, 20 Dec 2023 10:04:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <ZXxUx_nh4HNTaDJx@codewreck.org>
References: <ZXxUx_nh4HNTaDJx@codewreck.org> <20231213152350.431591-1-dhowells@redhat.com> <20231215-einziehen-landen-94a63dd17637@brauner>
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: dhowells@redhat.com, Christian Brauner <brauner@kernel.org>,
    Jeff Layton <jlayton@kernel.org>, Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/39] netfs, afs, 9p: Delegate high-level I/O to netfslib
MIME-Version: 1.0
Date: Wed, 20 Dec 2023 10:04:26 +0000
Message-ID: <1384979.1703066666@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1384978.1703066666.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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

Dominique Martinet <asmadeus@codewreck.org> wrote:

> I'll go back to dhowell's tree to finally test 9p a bit,
> sorry for lack of involvement just low on time all around.

I've rebased my tree on -rc6 rather than linux-next for Christian to pull.

Ganesha keeps falling over:

[root@carina build]# valgrind ./ganesha.nfsd -L /var/log/ganesha/ganesha.log -f /etc/ganesha/ganesha.conf -N NIV_EVENT -F
==38960== Memcheck, a memory error detector
==38960== Copyright (C) 2002-2022, and GNU GPL'd, by Julian Seward et al.
==38960== Using Valgrind-3.22.0 and LibVEX; rerun with -h for copyright info
==38960== Command: ./ganesha.nfsd -L /var/log/ganesha/ganesha.log -f /etc/ganesha/ganesha.conf -N NIV_EVENT -F
==38960== 
==38960== Thread 138:
==38960== Invalid read of size 4
==38960==    at 0x4DC32D6: pthread_cond_signal@@GLIBC_2.3.2 (pthread_cond_signal.c:41)
==38960==    by 0x489700C: sync_cb (fsal_helper.c:1837)
==38960==    by 0x49D79DF: mdc_read_super_cb (mdcache_file.c:559)
==38960==    by 0x49D7AC5: mdc_read_cb (mdcache_file.c:582)
==38960==    by 0x7B4B81F: vfs_read2 (file.c:1317)
==38960==    by 0x49D7BCF: mdcache_read2 (mdcache_file.c:617)
==38960==    by 0x4897173: fsal_read (fsal_helper.c:1849)
==38960==    by 0x4A10FD4: _9p_read (9p_read.c:134)
==38960==    by 0x4A0A024: _9p_process_buffer (9p_interpreter.c:181)
==38960==    by 0x4A09DCB: _9p_tcp_process_request (9p_interpreter.c:133)
==38960==    by 0x48CE182: _9p_execute (9p_dispatcher.c:315)
==38960==    by 0x48CE508: _9p_worker_run (9p_dispatcher.c:412)
==38960==  Address 0x24 is not stack'd, malloc'd or (recently) free'd
==38960== 
==38960== 
==38960== Process terminating with default action of signal 11 (SIGSEGV): dumping core
==38960==  Access not within mapped region at address 0x24
==38960==    at 0x4DC32D6: pthread_cond_signal@@GLIBC_2.3.2 (pthread_cond_signal.c:41)
==38960==    by 0x489700C: sync_cb (fsal_helper.c:1837)
==38960==    by 0x49D79DF: mdc_read_super_cb (mdcache_file.c:559)
==38960==    by 0x49D7AC5: mdc_read_cb (mdcache_file.c:582)
==38960==    by 0x7B4B81F: vfs_read2 (file.c:1317)
==38960==    by 0x49D7BCF: mdcache_read2 (mdcache_file.c:617)
==38960==    by 0x4897173: fsal_read (fsal_helper.c:1849)
==38960==    by 0x4A10FD4: _9p_read (9p_read.c:134)
==38960==    by 0x4A0A024: _9p_process_buffer (9p_interpreter.c:181)
==38960==    by 0x4A09DCB: _9p_tcp_process_request (9p_interpreter.c:133)
==38960==    by 0x48CE182: _9p_execute (9p_dispatcher.c:315)
==38960==    by 0x48CE508: _9p_worker_run (9p_dispatcher.c:412)

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

