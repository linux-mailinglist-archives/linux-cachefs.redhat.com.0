Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEA5741D4A
	for <lists+linux-cachefs@lfdr.de>; Thu, 29 Jun 2023 02:40:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687999216;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LmB3ZNQjQjDlhYlQLT1616rEmY8L1e8pYt+dHOlVpF0=;
	b=EXhSRjTybT0FLCckfTEEulqkvbaMpLR+vGs2Fpfj1PMqBMEiwSPDkjKFGMeWWBvpgi7Tay
	AYkELqSJTRH3nDeBSpQcZ+trTQqCnp80BCAiPCw02AuMlfoHToKR0/q5I7REQBRXc+vW4h
	o9ul/aJFnywP/BHZqUZkJaniNp9MdC4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-1TCU5LEQORmfvWbj2ugcyA-1; Wed, 28 Jun 2023 20:40:12 -0400
X-MC-Unique: 1TCU5LEQORmfvWbj2ugcyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 168AB1044589;
	Thu, 29 Jun 2023 00:40:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 19DDC200B677;
	Thu, 29 Jun 2023 00:40:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C9C221946A41;
	Thu, 29 Jun 2023 00:40:10 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CE31B1946589 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 29 Jun 2023 00:40:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 82663C09A07; Thu, 29 Jun 2023 00:40:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B0B8C1ED98
 for <linux-cachefs@redhat.com>; Thu, 29 Jun 2023 00:40:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40D783C01C20
 for <linux-cachefs@redhat.com>; Thu, 29 Jun 2023 00:40:09 +0000 (UTC)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-J1CEw5YpNuCVJ-lM7RQgSg-1; Wed, 28 Jun 2023 20:40:08 -0400
X-MC-Unique: J1CEw5YpNuCVJ-lM7RQgSg-1
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-54ff478ab88so84267a12.1
 for <linux-cachefs@redhat.com>; Wed, 28 Jun 2023 17:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687999207; x=1690591207;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GBoFOtIWRHIKoWf0lrD2wG9OyN2hTf5a/5og68Y1whI=;
 b=gg+pNlfooFKmDEzRtJwjlM1KmnwxbjARXZpeu+bnjva+VNXuWUGyzikCZv8Xr12v55
 yUnlNnG294zBPmTdvEIF+r61YRC4Lat8tPx1GTpgZ4nu1viE+l+DQYpjEdP2C2jAL1i+
 6WnD2s3QExfNLTHU4wnCzR9FJEpsFwZmXrxGGvMI2PKiJWMDpNbhzUdZHnV6hEBLGkbi
 QmNpk34US7pJgjYsJeHlNxRijH6gKfdwfJl6Y4zgCYVFIsdgHpQR88wZ6H5E9M0Zu64w
 M2B6R9KwX7oUx5IGeIuMWl0sIXlfk6Telj7IzA8qUuZL1ahYy2no7BSC5Ugg5XgjK7bD
 /KGg==
X-Gm-Message-State: AC+VfDwhq2mTcPB+9Z2bO5rnnQ7NhzMt+xUiL0BawbqYo95UMuVnc1oa
 lsjTOl/K637YLVPeaQim/qDV5UzQynzVgY5n70uTFrO9gskssVEzaZmAsoun68FcTGTf6RZ8q2X
 jNoMhhnMUuDvxAP6XDNdJxg==
X-Received: by 2002:a05:6a21:32a2:b0:125:699a:599b with SMTP id
 yt34-20020a056a2132a200b00125699a599bmr15662836pzb.34.1687999206971; 
 Wed, 28 Jun 2023 17:40:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5vLdftDDvS6DadhOeggrwPU/ORSuzVvDK1nPTA87qiG12zTXbeuXwcom3dX8ucd1whR5HDYQ==
X-Received: by 2002:a05:6a21:32a2:b0:125:699a:599b with SMTP id
 yt34-20020a056a2132a200b00125699a599bmr15662825pzb.34.1687999206657; 
 Wed, 28 Jun 2023 17:40:06 -0700 (PDT)
Received: from [10.72.13.91] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 d14-20020aa78e4e000000b0067acbc74977sm4268764pfr.96.2023.06.28.17.40.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jun 2023 17:40:06 -0700 (PDT)
Message-ID: <41e1c831-29de-8494-d925-6e2eb379567f@redhat.com>
Date: Thu, 29 Jun 2023 08:39:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: David Howells <dhowells@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20230628104852.3391651-1-dhowells@redhat.com>
 <20230628104852.3391651-3-dhowells@redhat.com>
From: Xiubo Li <xiubli@redhat.com>
In-Reply-To: <20230628104852.3391651-3-dhowells@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH v7 2/2] mm, netfs,
 fscache: Stop read optimisation when folio removed from pagecache
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-mm@kvack.org,
 Rohith Surabattula <rohiths.msft@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dominique Martinet <asmadeus@codewreck.org>, Jeff Layton <jlayton@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
 Christoph Hellwig <hch@infradead.org>, Steve French <sfrench@samba.org>,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ceph-devel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 6/28/23 18:48, David Howells wrote:
> Fscache has an optimisation by which reads from the cache are skipped until
> we know that (a) there's data there to be read and (b) that data isn't
> entirely covered by pages resident in the netfs pagecache.  This is done
> with two flags manipulated by fscache_note_page_release():
>
> 	if (...
> 	    test_bit(FSCACHE_COOKIE_HAVE_DATA, &cookie->flags) &&
> 	    test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags))
> 		clear_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
>
> where the NO_DATA_TO_READ flag causes cachefiles_prepare_read() to indicate
> that netfslib should download from the server or clear the page instead.
>
> The fscache_note_page_release() function is intended to be called from
> ->releasepage() - but that only gets called if PG_private or PG_private_2
> is set - and currently the former is at the discretion of the network
> filesystem and the latter is only set whilst a page is being written to the
> cache, so sometimes we miss clearing the optimisation.
>
> Fix this by following Willy's suggestion[1] and adding an address_space
> flag, AS_RELEASE_ALWAYS, that causes filemap_release_folio() to always call
> ->release_folio() if it's set, even if PG_private or PG_private_2 aren't
> set.
>
> Note that this would require folio_test_private() and page_has_private() to
> become more complicated.  To avoid that, in the places[*] where these are
> used to conditionalise calls to filemap_release_folio() and
> try_to_release_page(), the tests are removed the those functions just
> jumped to unconditionally and the test is performed there.
>
> [*] There are some exceptions in vmscan.c where the check guards more than
> just a call to the releaser.  I've added a function, folio_needs_release()
> to wrap all the checks for that.
>
> AS_RELEASE_ALWAYS should be set if a non-NULL cookie is obtained from
> fscache and cleared in ->evict_inode() before truncate_inode_pages_final()
> is called.
>
> Additionally, the FSCACHE_COOKIE_NO_DATA_TO_READ flag needs to be cleared
> and the optimisation cancelled if a cachefiles object already contains data
> when we open it.
>
> Fixes: 1f67e6d0b188 ("fscache: Provide a function to note the release of a page")
> Fixes: 047487c947e8 ("cachefiles: Implement the I/O routines")
> Reported-by: Rohith Surabattula <rohiths.msft@gmail.com>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Matthew Wilcox <willy@infradead.org>
> cc: Linus Torvalds <torvalds@linux-foundation.org>
> cc: Steve French <sfrench@samba.org>
> cc: Shyam Prasad N <nspmangalore@gmail.com>
> cc: Rohith Surabattula <rohiths.msft@gmail.com>
> cc: Dave Wysochanski <dwysocha@redhat.com>
> cc: Dominique Martinet <asmadeus@codewreck.org>
> cc: Ilya Dryomov <idryomov@gmail.com>
> cc: linux-cachefs@redhat.com
> cc: linux-cifs@vger.kernel.org
> cc: linux-afs@lists.infradead.org
> cc: v9fs-developer@lists.sourceforge.net
> cc: ceph-devel@vger.kernel.org
> cc: linux-nfs@vger.kernel.org
> cc: linux-fsdevel@vger.kernel.org
> cc: linux-mm@kvack.org
> ---
>
> Notes:
>      ver #7)
>       - Make NFS set AS_RELEASE_ALWAYS.
>      
>      ver #4)
>       - Split out merging of folio_has_private()/filemap_release_folio() call
>         pairs into a preceding patch.
>       - Don't need to clear AS_RELEASE_ALWAYS in ->evict_inode().
>      
>      ver #3)
>       - Fixed mapping_clear_release_always() to use clear_bit() not set_bit().
>       - Moved a '&&' to the correct line.
>      
>      ver #2)
>       - Rewrote entirely according to Willy's suggestion[1].
>
>   fs/9p/cache.c           |  2 ++
>   fs/afs/internal.h       |  2 ++
>   fs/cachefiles/namei.c   |  2 ++
>   fs/ceph/cache.c         |  2 ++
>   fs/nfs/fscache.c        |  3 +++
>   fs/smb/client/fscache.c |  2 ++
>   include/linux/pagemap.h | 16 ++++++++++++++++
>   mm/internal.h           |  5 ++++-
>   8 files changed, 33 insertions(+), 1 deletion(-)

Just one question. Shouldn't do this in 'fs/erofs/fscache.c' too ?

>
> diff --git a/fs/9p/cache.c b/fs/9p/cache.c
> index cebba4eaa0b5..12c0ae29f185 100644
> --- a/fs/9p/cache.c
> +++ b/fs/9p/cache.c
> @@ -68,6 +68,8 @@ void v9fs_cache_inode_get_cookie(struct inode *inode)
>   				       &path, sizeof(path),
>   				       &version, sizeof(version),
>   				       i_size_read(&v9inode->netfs.inode));
> +	if (v9inode->netfs.cache)
> +		mapping_set_release_always(inode->i_mapping);
>   
>   	p9_debug(P9_DEBUG_FSC, "inode %p get cookie %p\n",
>   		 inode, v9fs_inode_cookie(v9inode));
> diff --git a/fs/afs/internal.h b/fs/afs/internal.h
> index 9d3d64921106..da73b97e19a9 100644
> --- a/fs/afs/internal.h
> +++ b/fs/afs/internal.h
> @@ -681,6 +681,8 @@ static inline void afs_vnode_set_cache(struct afs_vnode *vnode,
>   {
>   #ifdef CONFIG_AFS_FSCACHE
>   	vnode->netfs.cache = cookie;
> +	if (cookie)
> +		mapping_set_release_always(vnode->netfs.inode.i_mapping);

If all the cookie need to do the same thing, then how about doing this 
in 'fscache_acquire_cookie()' ?

Thanks

- Xiubo

>   #endif
>   }
>   
> diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
> index d9d22d0ec38a..7bf7a5fcc045 100644
> --- a/fs/cachefiles/namei.c
> +++ b/fs/cachefiles/namei.c
> @@ -585,6 +585,8 @@ static bool cachefiles_open_file(struct cachefiles_object *object,
>   	if (ret < 0)
>   		goto check_failed;
>   
> +	clear_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &object->cookie->flags);
> +
>   	object->file = file;
>   
>   	/* Always update the atime on an object we've just looked up (this is
> diff --git a/fs/ceph/cache.c b/fs/ceph/cache.c
> index 177d8e8d73fe..de1dee46d3df 100644
> --- a/fs/ceph/cache.c
> +++ b/fs/ceph/cache.c
> @@ -36,6 +36,8 @@ void ceph_fscache_register_inode_cookie(struct inode *inode)
>   				       &ci->i_vino, sizeof(ci->i_vino),
>   				       &ci->i_version, sizeof(ci->i_version),
>   				       i_size_read(inode));
> +	if (ci->netfs.cache)
> +		mapping_set_release_always(inode->i_mapping);
>   }
>   
>   void ceph_fscache_unregister_inode_cookie(struct ceph_inode_info *ci)
> diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
> index 8c35d88a84b1..b05717fe0d4e 100644
> --- a/fs/nfs/fscache.c
> +++ b/fs/nfs/fscache.c
> @@ -180,6 +180,9 @@ void nfs_fscache_init_inode(struct inode *inode)
>   					       &auxdata,      /* aux_data */
>   					       sizeof(auxdata),
>   					       i_size_read(inode));
> +
> +	if (netfs_inode(inode)->cache)
> +		mapping_set_release_always(inode->i_mapping);
>   }
>   
>   /*
> diff --git a/fs/smb/client/fscache.c b/fs/smb/client/fscache.c
> index 8f6909d633da..3677525ee993 100644
> --- a/fs/smb/client/fscache.c
> +++ b/fs/smb/client/fscache.c
> @@ -108,6 +108,8 @@ void cifs_fscache_get_inode_cookie(struct inode *inode)
>   				       &cifsi->uniqueid, sizeof(cifsi->uniqueid),
>   				       &cd, sizeof(cd),
>   				       i_size_read(&cifsi->netfs.inode));
> +	if (cifsi->netfs.cache)
> +		mapping_set_release_always(inode->i_mapping);
>   }
>   
>   void cifs_fscache_unuse_inode_cookie(struct inode *inode, bool update)
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index a56308a9d1a4..a1176ceb4a0c 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -199,6 +199,7 @@ enum mapping_flags {
>   	/* writeback related tags are not used */
>   	AS_NO_WRITEBACK_TAGS = 5,
>   	AS_LARGE_FOLIO_SUPPORT = 6,
> +	AS_RELEASE_ALWAYS,	/* Call ->release_folio(), even if no private data */
>   };
>   
>   /**
> @@ -269,6 +270,21 @@ static inline int mapping_use_writeback_tags(struct address_space *mapping)
>   	return !test_bit(AS_NO_WRITEBACK_TAGS, &mapping->flags);
>   }
>   
> +static inline bool mapping_release_always(const struct address_space *mapping)
> +{
> +	return test_bit(AS_RELEASE_ALWAYS, &mapping->flags);
> +}
> +
> +static inline void mapping_set_release_always(struct address_space *mapping)
> +{
> +	set_bit(AS_RELEASE_ALWAYS, &mapping->flags);
> +}
> +
> +static inline void mapping_clear_release_always(struct address_space *mapping)
> +{
> +	clear_bit(AS_RELEASE_ALWAYS, &mapping->flags);
> +}
> +
>   static inline gfp_t mapping_gfp_mask(struct address_space * mapping)
>   {
>   	return mapping->gfp_mask;
> diff --git a/mm/internal.h b/mm/internal.h
> index a76314764d8c..86aef26df905 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -175,7 +175,10 @@ static inline void set_page_refcounted(struct page *page)
>    */
>   static inline bool folio_needs_release(struct folio *folio)
>   {
> -	return folio_has_private(folio);
> +	struct address_space *mapping = folio->mapping;
> +
> +	return folio_has_private(folio) ||
> +		(mapping && mapping_release_always(mapping));
>   }
>   
>   extern unsigned long highest_memmap_pfn;
> --
> Linux-cachefs mailing list
> Linux-cachefs@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-cachefs
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

